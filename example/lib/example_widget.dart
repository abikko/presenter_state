import 'package:example/example_contract.dart';
import 'package:example/example_presenter.dart';
import 'package:example/example_state.dart';
import 'package:flutter/material.dart';
import 'package:presenter_state/presenter_stater.dart';

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  final ExampleContract contract = ExamplePresenter();

  @override
  Widget build(BuildContext context) {
    return ReferAction<ExampleContract, ExampleState>(
      contract: contract,
      builder: (_, ExampleState state) {
        return switch (state) {
          ExampleInitialState() => Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(""),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => contract.add(),
                        child: const Text("+"),
                      ),
                      ElevatedButton(
                        onPressed: () => contract.decrease(),
                        child: const Text("-"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ExampleLoadingState() => const CircularProgressIndicator(),
        };
      },
    );
  }
}
