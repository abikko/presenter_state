import 'package:flutter/cupertino.dart';
import 'package:presenter_state/widget/contract_scope.dart';

extension ContractContextExtension on BuildContext {
  Object? watchPossibleContract<T>() => ContractScope.maybeOf<T>(this);

  Object watchContract<T>() => ContractScope.of(this);
}
