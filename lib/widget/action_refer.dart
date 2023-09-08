import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

typedef ActionReferWidgetBuilder<T> = Widget Function(BuildContext context, AsyncSnapshot<T> state);

class ActionRefer<IContract extends Contract, State> extends StatelessWidget {
  final IContract contract;
  final State? initialState;
  final ActionReferWidgetBuilder builder;

  const ActionRefer({
    required this.contract,
    required this.builder,
    this.initialState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: contract.currentState(),
      builder: builder,
    );
  }
}
