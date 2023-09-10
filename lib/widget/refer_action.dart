import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

typedef ReferActionWidgetBuilder<T> = Widget Function(BuildContext context, AsyncSnapshot<T> state);

class ReferAction<IContract extends Contract, S> extends StatefulWidget {
  final IContract contract;
  final S? initialState;
  final ReferActionWidgetBuilder<S> builder;

  const ReferAction({
    required this.contract,
    required this.builder,
    this.initialState,
    super.key,
  });

  @override
  State<ReferAction<IContract, S>> createState() => _ReferActionState<IContract, S>();
}

class _ReferActionState<IContract extends Contract, S> extends State<ReferAction<IContract, S>> {
  late final IContract contract;
  late final S? initialState;

  @override
  void initState() {
    contract = widget.contract;
    initialState = widget.initialState;
    assert(
      widget.contract.watchState() is Stream<S>,
      "Provided an error [IContract] object",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      initialData: contract.initialState(),
      stream: contract.watchState().map((event) => event as S),
      builder: widget.builder,
    );
  }

  @override
  void dispose() {
    contract.dispose();
    super.dispose();
  }
}
