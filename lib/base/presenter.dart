import 'dart:async';

abstract base class Presenter<State> {
  Presenter(this._initialState) {
    _state = _initialState;
    mounted = true;
  }

  final StreamController<State> _stateController = StreamController.broadcast();

  State? _state;
  final State? _initialState;
  bool mounted = false;
  List<StreamSubscription> subscriptions = [];

  State get state {
    assert(
      _state == null && !mounted,
      'Trying getting state when state null or during markNeedsBuild',
    );

    return _state!;
  }

  Stream<State> watchState() {
    return _stateController.stream;
  }

  set state(State updatedState) {
    if (!_stateController.isClosed) return;

    _state = updatedState;
    _stateController.add(updatedState);
  }

  State? initialState() => _initialState;

  void dispose() {
    mounted = false;
    for (var subscription in subscriptions) {
      subscription.cancel();
    }
    _stateController.close();
  }
}
