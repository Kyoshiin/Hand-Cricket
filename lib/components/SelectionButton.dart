import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/screens/batting_page.dart';
import '../constants.dart';

class SelecButton extends StatelessWidget {
  SelecButton({@required this.ButtonName,@required this.ButtonAction});

  final String ButtonName;
  final Function ButtonAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: EdgeInsets.all(kHeadpadding),
        child: GestureDetector(
          onTap: ButtonAction,
          child: Text(
            ButtonName,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.brown,
          border: Border.all(color: Colors.white, width: 2)),
    );
  }
}