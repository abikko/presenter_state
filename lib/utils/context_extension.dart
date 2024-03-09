import 'package:flutter/cupertino.dart';
import 'package:presenter_state/widget/contract_scoper.dart';

extension ContractContextExtension on BuildContext {
  Object? watchPossibleContract<T>() => ContractScoper.maybeOf(this);

  Object watchContract<T>() => ContractScoper.of(this);
}
