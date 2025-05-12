import 'package:example/example_contract.dart';
import 'package:example/example_presenter.dart';
import 'package:example/example_state.dart';
import 'package:flutter/material.dart';
import 'package:presenter_state/presenter_state.dart';
import 'package:provider/provider.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContractProvider<ExampleState, ExampleContract>(
      create: (BuildContext context) => ExamplePresenter(),
      child: PresenterBuilder<ExampleContract, ExampleState>(
        builder: (context, ExampleState state) {
          return switch (state) {
            ExampleInitialState() => Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      switch (state) {
                        ExampleInitialState() => state.count.toString(),
                      },
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => context.read<ExampleContract>().add(),
                          child: const Text("+"),
                        ),
                        ElevatedButton(
                          onPressed: () => context.read<ExampleContract>().decrease(),
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
      ),
    );
  }
}
