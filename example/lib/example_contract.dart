import 'package:example/example_state.dart';
import 'package:presenter_state/presenter_stater.dart';

/// Currently, we have to use keyword "implements" instead of "extends"
///
/// [https://dart.dev/tools/diagnostic-messages#invalid_use_of_type_outside_library]
abstract interface class ExampleContract implements Contract<ExampleState> {
  void add();

  void decrease();
}
