import 'package:example/example_contract.dart';
import 'package:example/example_state.dart';
import 'package:presenter_state/base/presenter.dart';

final class ExamplePresenter extends Presenter<ExampleContract, ExampleState>
    implements ExampleContract {
  ExamplePresenter() : super(ExampleInitialState());

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Stream currentState() {
    return stream;
  }
}
