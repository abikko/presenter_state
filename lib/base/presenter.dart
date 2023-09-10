import 'dart:async';

import 'package:presenter_state/base/contract.dart';

abstract base class Presenter<IContract extends Contract, State> {
  Presenter(this._initialState) {
    _state = _initialState;
    mounted = true;
  }

  Stream<State> get stream => _stateController.stream;
  final StreamController<State> _stateController = StreamController.broadcast();

  State? _state;
  final State? _initialState;
  bool mounted = false;
  bool shouldNotify = false;

  State get state {
    assert(
      _state == null && !mounted,
      'Trying getting state when state null or during markNeedsBuild',
    );

    return _state!;
  }

  set state(State updatedState) {
    if (!_stateController.isClosed) return;

    _state = updatedState;

    if (shouldNotify) _stateController.add(updatedState);
  }

  void notifyListeners() {
    bool tempVariable = shouldNotify;
    shouldNotify = true;
    state = state;
    shouldNotify = tempVariable;
  }

  State? initialState() => _initialState;

  void dispose() {
    mounted = false;
    _stateController.close();
  }
}
