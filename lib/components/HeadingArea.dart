import 'package:flutter/material.dart';
import '../constants.dart';

class BuildHeader extends StatelessWidget {
  BuildHeader({@required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.brown,
      child: Padding(
        padding: EdgeInsets.all(kHeadpadding*Sc_height),
        child: Text(heading,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sc_height*0.022,
          ),),
      ),
    );
  }
}