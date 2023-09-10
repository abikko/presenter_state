import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

class ContractScope extends InheritedWidget {
  final Contract contract;
  const ContractScope({
    required Widget child,
    required this.contract,
    super.key,
  }) : super(child: child);

  static ContractScope of(BuildContext context) {
    final ContractScope? result = context.dependOnInheritedWidgetOfExactType<ContractScope>();
    assert(result != null, 'No ContractScope found in context');
    return result!;
  }

  static ContractScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContractScope>();
  }

  @override
  bool updateShouldNotify(ContractScope oldWidget) {
    return identical(oldWidget.contract, contract);
  }
}
