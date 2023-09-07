import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

class ActionRefer<IContract extends Contract, State> extends StatelessWidget {
  final Widget child;
  final IContract contract;
  final State? initialState;

  const ActionRefer({super.key, required this.child, required this.contract, this.initialState});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: contract.stream(), builder: );
  }
}
