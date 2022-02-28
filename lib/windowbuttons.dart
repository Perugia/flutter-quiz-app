import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          Row(
            children: [
              MinimizeWindowButton(),
              CloseWindowButton(),
            ],
          ),
        ],
      ),
    );
  }
}
