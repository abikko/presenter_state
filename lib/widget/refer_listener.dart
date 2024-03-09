import 'package:flutter/material.dart';
import 'package:presenter_state/base/contract.dart';

/// Adds possibility to read [IContract]type nearest in the widget tree
///
/// To get more information read [https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html]
class ReferListener<IContract extends Contract> extends StatefulWidget {
  final Widget child;

  const ReferListener({super.key, required this.child});

  @override
  State<ReferListener> createState() => _ReferListenerState();
}

class _ReferListenerState extends State<ReferListener> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
