import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

typedef PresenterWidgetBuilder<T> = Widget Function(BuildContext context, T state);

class PresenterBuilder<IContract extends Contract<S>, S> extends StatefulWidget {
  const PresenterBuilder({
    required this.contract,
    required this.builder,
    this.initialState,
    super.key,
  });

  final IContract contract;
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
    contract = widget.contract;
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
