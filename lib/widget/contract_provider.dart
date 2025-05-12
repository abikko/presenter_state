import 'package:presenter_state/base/contract.dart';
import 'package:provider/provider.dart';

class ContractProvider<State, IContract extends Contract<State>> extends Provider<IContract> {
  ContractProvider({
    required super.child,
    required super.create,
    super.builder,
    super.dispose,
    super.lazy,
    super.key,
  });
}
