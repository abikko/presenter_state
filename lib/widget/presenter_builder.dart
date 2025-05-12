import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';
import 'package:provider/provider.dart';

typedef PresenterWidgetBuilder<T> = Widget Function(BuildContext context, T state);

class PresenterBuilder<IContract extends Contract<S>, S> extends StatefulWidget {
  const PresenterBuilder({
    required this.builder,
    this.contract,
    this.initialState,
    super.key,
  });

  final IContract? contract;
  final S? initialState;
  final PresenterWidgetBuilder<S> builder;

  @override
  State<PresenterBuilder<IContract, S>> createState() => _PresenterBuilderState<IContract, S>();
}

class _PresenterBuilderState<IContract extends Contract<S>, S> extends State<PresenterBuilder<IContract, S>> {
  late final IContract contract;
  late final S? initialState;

  @override
  void initState() {
    super.initState();
    contract = widget.contract ?? context.read<IContract>();
    initialState = widget.initialState;
  }

  Widget map(BuildContext context, AsyncSnapshot<S> snapshot) {
    if (snapshot.hasError) {
      throw snapshot.error! as Exception;
    }
    return widget.builder(context, snapshot.data as S);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      initialData: contract.initialState,
      stream: contract.watchState(),
      builder: map,
    );
  }

  @override
  void dispose() {
    contract.dispose();
    super.dispose();
  }
}
