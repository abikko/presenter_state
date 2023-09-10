import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

class ContractScoper<IContract extends Contract> extends InheritedWidget {
  final IContract contract;
  const ContractScoper({
    required Widget child,
    required this.contract,
    super.key,
  }) : super(child: child);

  static ContractScoper of(BuildContext context) {
    final ContractScoper? result = context.dependOnInheritedWidgetOfExactType<ContractScoper>();
    assert(result != null, 'No ContractScope found in context');
    return result!;
  }

  static ContractScoper? maybeOf<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ContractScoper>();

  @override
  bool updateShouldNotify(ContractScoper oldWidget) {
    return identical(oldWidget.contract, contract);
  }
}
