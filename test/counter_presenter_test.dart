import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presenter_state/presenter_state.dart';

final class MockState extends Mock {
  MockState({required this.value});
  final int value;
}

abstract interface class MockContract implements Contract<MockState> {
  void add();
  void decrease();
}

final class MockPresenter extends Presenter<MockState> implements MockContract {
  MockPresenter() : super(MockState(value: 0));

  @override
  MockState get initialState => MockState(value: 0);

  @override
  void add() {
    state = MockState(value: state.value + 1);
  }

  @override
  void decrease() {
    if (state.value > 1) state = MockState(value: state.value - 1);
  }
}

void main() {
  group('Presenter counter test', () {
    test('Presenter state value increment', () {
      final MockContract presenter = MockPresenter();
      presenter.add();
      expect(presenter.state.value, 1);
    });
    test('Presenter state value decrease', () {
      final MockContract presenter = MockPresenter();
      presenter.decrease();
      expect(presenter.state.value, 0);
    });
  });
}
