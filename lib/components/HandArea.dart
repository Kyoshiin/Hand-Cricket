import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'HeadingArea.dart';

class buildHand extends StatelessWidget {

  buildHand({@required this.heading,@required this.Handno});

  final String heading;
  final int Handno;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sc_width*0.45,
      // height: Sc_width*0.42,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          CircleAvatar(
            radius: 0.16 * Sc_width,
            backgroundColor: Colors.blue,       // for border
            child: CircleAvatar(
              radius: 0.14 * Sc_width,
              backgroundColor: Colors.white,
              child: Image.asset('images/$Handno.png',height: ImgSize),
            ),
          ),

          SizedBox(height: 6,),

          BuildHeader(heading:heading),
        ],
      ),
    );
  }
}

