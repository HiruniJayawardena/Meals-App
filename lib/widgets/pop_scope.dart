import 'package:flutter/material.dart';

class PopScope extends StatelessWidget {
  final Function(bool didPop, dynamic result)? onPopInvokedResult;
  final Widget child;

  PopScope({required this.child, this.onPopInvokedResult});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool didPop = true; // or false based on your logic
        dynamic result = {}; // Provide any result if needed
        if (onPopInvokedResult != null) {
          onPopInvokedResult!(didPop, result);
        }
        return didPop;
      },
      child: child,
    );
  }
}