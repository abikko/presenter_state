abstract interface class Contract<State> {
  void init();

  void dispose();

  Stream<State> watchState();

  State? initialState();
}
