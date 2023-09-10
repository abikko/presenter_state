import 'package:example/example_contract.dart';
import 'package:example/example_state.dart';
import 'package:presenter_state/base/presenter.dart';

final class ExamplePresenter extends Presenter<ExampleContract, ExampleState>
    implements ExampleContract {
  ExamplePresenter() : super(ExampleInitialState(count: 0));

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void add() {
    state = ExampleInitialState(count: state.count + 1);
    notifyListeners();
  }

  @override
  void decrease() {
    if (state.count == 0) return;

    state = ExampleInitialState(count: state.count - 1);
    notifyListeners();
  }

  @override
  ExampleState? currentState() {
    // TODO: implement currentState
    throw UnimplementedError();
  }

  @override
  Stream<ExampleState> watchState() {
    // TODO: implement watchState
    throw UnimplementedError();
  }
}
