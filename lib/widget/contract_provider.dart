import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

class ContractProvider<IContract extends Contract<State>> extends InheritedWidget {
  const ContractProvider({
    required super.child,
    required this.contract,
    super.key,
  });
  final IContract contract;

  static ContractProvider of(BuildContext context) {
    final ContractProvider? result = context.dependOnInheritedWidgetOfExactType<ContractProvider>();
    assert(result != null, 'No ContractScope found in context');
    return result!;
  }

  static ContractProvider? maybeOf<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ContractProvider>();

  @override
  bool updateShouldNotify(ContractProvider oldWidget) {
    return identical(oldWidget.contract, contract);
  }
}
