import 'dart:async';

import 'package:presenter_state/base/contract.dart';

abstract base class Presenter<IContract extends Contract, State> {
  Presenter(State initialState) {
    _state = initialState;
    mounted = true;
  }

  State? _state;
  bool mounted = false;

  final StreamController<State> _stateController = StreamController.broadcast();

  State get state {
    assert(
      _state == null && !mounted,
      'Trying getting state when state null or during markNeedsBuild',
    );

    return _state!;
  }

  Stream<State> get stream => _stateController.stream;

  bool shouldNotify = false;

  set state(State updatedState) {
    if (!_stateController.isClosed) return;

    _state = updatedState;

    if (shouldNotify) _stateController.add(updatedState);
  }

  void dispose() {
    mounted = false;
    _stateController.close();
  }
}
