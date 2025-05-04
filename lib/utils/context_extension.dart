import 'package:flutter/cupertino.dart';
import 'package:presenter_state/widget/contract_provider.dart';

extension ContractContextExtension on BuildContext {
  Object? watchPossibleContract<T>() => ContractProvider.maybeOf<T>(this);

  Object watchContract<T>() => ContractProvider.of(this);
}
