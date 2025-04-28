import 'dart:async';

abstract class PresenterStream<State> {
  Stream<State> get stream;

  //TODO: Think about using StreamController.broadcast - I think it is working a little bit strange...
  late final StreamController<State> stateBroadcastController;
}

abstract base class Presenter<State> extends PresenterStream<State> {
  Presenter(this._initialState) {
    _state = _initialState;
    mounted = true;
    stateBroadcastController = StreamController<State>.broadcast();
  }

  State? _state;
  final State? _initialState;
  bool mounted = false;

  @override
  Stream<State> get stream => stateBroadcastController.stream;

  State get state {
    assert(
      _state != null && mounted,
      'Trying getting state when state null or during markNeedsBuild',
    );

    return _state!;
  }

  Stream<State> watchState() {
    return stateBroadcastController.stream;
  }

  set state(State updatedState) {
    if (stateBroadcastController.isClosed) return;

    _state = updatedState;
    stateBroadcastController.add(updatedState);
  }

  void dispose() {
    mounted = false;
    stateBroadcastController.close();
  }
}
