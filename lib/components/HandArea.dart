import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'HeadingArea.dart';

class buildHand extends StatelessWidget {

  buildHand({@required this.heading,@required this.Handno});

  final String heading;
  final int Handno;

  double ImgSize = 0.23*Sc_width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sc_width*0.45,
      // height: Sc_width*0.42,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white,
            width: 2, )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          BuildHeader(heading:heading),

          Padding(
            padding: EdgeInsets.symmetric(vertical: Sc_width*0.02),
            child: CircleAvatar(
              radius: 0.14 * Sc_width,
              backgroundColor: Colors.white,
              child: Image.asset('images/$Handno.png',height: ImgSize),
            ),
          ),
        ],
      ),
    );
  }
}

