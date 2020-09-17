import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ExitAlertDialog extends StatelessWidget {

  ExitAlertDialog(this.c);
  BuildContext c;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Do you really want to exit?'),
      actions: [
        FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(c, true);
              SystemNavigator.pop();
            }),
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.pop(c, false),
        ),
      ],
    );
  }
}