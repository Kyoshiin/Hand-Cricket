import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/components/icon_content.dart';

//USED IN SELECTION PAGE
class SelecButton extends StatelessWidget {
  SelecButton({@required this.icondetails,@required this.ButtonAction, @required this.color});

  final IconContent icondetails;
  final Function ButtonAction;
  final Color color;     //to set the active colour

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.4,
      child: RawMaterialButton(
        splashColor: Colors.transparent,
        onPressed: ButtonAction,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: icondetails,
        ),
      ),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 2)),
    );
  }
}