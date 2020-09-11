import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
class ResetAlertDialog extends StatelessWidget {

  ResetAlertDialog(this.c);
  BuildContext c;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Do you want to reset?'),
      actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            GameLogic().reset();
            Navigator.pop(c, true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.pop(c, false),
        ),
      ],
    );
  }
}