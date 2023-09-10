import 'package:flutter/cupertino.dart';
import 'package:presenter_state/widget/contract_scope.dart';

extension ContextExtension on BuildContext {
  Object? watchPossibleContract<T>() => ContractScoper.maybeOf(this);

  Object watchContract<T>() => ContractScoper.of(this);
}
