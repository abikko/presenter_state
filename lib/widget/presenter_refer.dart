import 'package:flutter/material.dart';
import 'package:presenter_state/base/base_contract.dart';

class PresenterRefer<IContract extends Contract, State> extends StatelessWidget {
  final Stream<State> stream;
  final AsyncWidgetBuilder<State> builder;
  const PresenterRefer({super.key, required this.stream, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: stream, builder: builder);
  }
}
