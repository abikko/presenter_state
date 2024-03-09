import 'package:example/example_contract.dart';
import 'package:example/example_state.dart';
import 'package:presenter_state/base/presenter.dart';

final class ExamplePresenter extends Presenter<ExampleState>
    implements ExampleContract {
  ExamplePresenter() : super(ExampleInitialState(count: 0));

  @override
  void init() {}

  @override
  void add() {
    state = ExampleInitialState(count: state.count + 1);
  }

  @override
  void decrease() {
    if (state.count == 0) return;

    state = ExampleInitialState(count: state.count - 1);
  }
}
