import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presenter_state/presenter_stater.dart';

final class MockState extends Mock {}

abstract interface class MockContract implements Contract<MockState> {}

final class MockPresenter extends Presenter<MockState> implements MockContract {
  MockPresenter(super.initialState);

  @override
  MockState get initialState => MockState();
}

void main() {
  group('Presenter test', () {});
}
