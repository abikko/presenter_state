import 'dart:async';

import 'package:presenter_state/base/base_contract.dart';

abstract base class Presenter<IContract extends Contract, State> {
  Presenter(this._contract);

  final IContract _contract;
  late State _state;
  final StreamController<State> _stateController = StreamController.broadcast();

  IContract get contract => _contract;

  State get state => _state;

  Stream<State> get stream => _stateController.stream;

  bool shouldNotify = false;

  set state(State updatedState) {
    if (!_stateController.isClosed) return;

    _state = updatedState;

    if (shouldNotify) _stateController.add(updatedState);
  }

  void dispose() {
    _stateController.close();
  }
}
