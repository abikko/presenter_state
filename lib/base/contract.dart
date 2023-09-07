abstract interface class Contract<State> {
  void init();

  void dispose();

  Stream<State> currentState();
}
