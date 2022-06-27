import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        color: Colors.deepOrange,
        child: Row(
          children: [
            Expanded(child: Container(color: Colors.deepOrange, child: MoveWindow())),
            Row(
              children: [
                MinimizeWindowButton(
                    colors: WindowButtonColors(normal: Colors.deepOrange)),
                CloseWindowButton(
                    colors: WindowButtonColors(normal: Colors.deepOrange)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
