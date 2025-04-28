import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

class ContractScope<IContract extends Contract> extends InheritedWidget {
  final IContract contract;

  const ContractScope({
    required super.child,
    required this.contract,
    super.key,
  });

  static ContractScope of(BuildContext context) {
    final ContractScope? result = context.dependOnInheritedWidgetOfExactType<ContractScope>();
    assert(result != null, 'No ContractScope found in context');
    return result!;
  }

  static ContractScope? maybeOf<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ContractScope>();

  @override
  bool updateShouldNotify(ContractScope oldWidget) {
    return identical(oldWidget.contract, contract);
  }
}
