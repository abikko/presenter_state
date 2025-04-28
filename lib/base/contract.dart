abstract interface class Contract<State> {
  const Contract({required this.initialState});
  void init();

  void dispose();

  Stream<State> watchState();

  final State initialState;
}
