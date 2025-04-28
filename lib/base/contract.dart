abstract interface class Contract<State> {
  void dispose();

  Stream<State> watchState();

  State get initialState;

  State get state;
}
