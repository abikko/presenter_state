sealed class ExampleState {
  final int count;

  ExampleState({required this.count});
}

class ExampleInitialState extends ExampleState {
  ExampleInitialState({required super.count});
}

class ExampleLoadingState extends ExampleState {
  ExampleLoadingState({required super.count});
}
