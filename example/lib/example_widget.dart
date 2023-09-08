import 'package:example/example_contract.dart';
import 'package:example/example_presenter.dart';
import 'package:flutter/material.dart';
import 'package:presenter_state/presenter_stater.dart';

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  final ExampleContract contract = ExamplePresenter();

  @override
  Widget build(BuildContext context) {
    return ActionRefer(
      contract: contract,
      builder: (_, __) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(""),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("-"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
