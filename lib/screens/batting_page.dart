import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/ImageHandler.dart';
import 'package:hand_cricket_flutter/components/HandArea.dart';
import 'package:hand_cricket_flutter/components/HeadingArea.dart';
import 'package:hand_cricket_flutter/components/ScoreArea.dart';
import 'package:hand_cricket_flutter/components/reset_dialog.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'package:hand_cricket_flutter/screens/overlay_fallofWkts.dart';

import 'package:hand_cricket_flutter/components/enumPage.dart';

GameLogic currentgame = GameLogic();
ImageHandler currentImg = ImageHandler();

class BattingPage extends StatefulWidget {
  @override
  _BattingPageState createState() => _BattingPageState();
}

class _BattingPageState extends State<BattingPage> {
  @override
  Widget build(BuildContext context) {
    Sc_width = MediaQuery.of(context).size.width;
    Sc_height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => ResetAlertDialog(c),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //Scoreboard
              Expanded(
                  child: Padding(
                padding: ScoreBoardPadding,
                child: Scoreboard('bat', Pg.BattingPage),
              )),

              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //display hands
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildHand(
                            heading: 'PLAYER HAND',
                            Handno: currentImg.getPlayerhand()),
                        buildHand(
                            heading: 'CPU HAND',
                            Handno: currentImg.getCpuhand()),
                      ],
                    ),

                    //3rd row
                    Container(
                      width: Sc_width * 0.8,
                      height: Sc_width * 0.6,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                      child: Column(
                        children: [
                          BuildHeader(heading: 'YOUR CHOICES FOR BATTING'),
                          Row(
                            children: [
                              createbtn(1),
                              createbtn(2),
                              createbtn(3),
                            ],
                          ),
                          Row(
                            children: [
                              createbtn(4),
                              createbtn(5),
                              createbtn(6),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createbtn(int imageno) {
    return RawMaterialButton(

      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.3, vertical: 15.3),
          child: CircleAvatar(
            radius: 0.085 * Sc_width,
            backgroundColor: Colors.blue, // for border
            child: CircleAvatar(
              radius: 0.075 * Sc_width,
              backgroundColor: Colors.white,
              child: Image.asset('images/$imageno.png', height: 50),
            ),
          ),
        ),
      ),

      //WORKING OF BUTTON
      onPressed: () {
        setState(() {
          if (currentgame.getplayerWickets() != '0' &&
              currentgame.getScoreDiff() >= 0) {
            currentImg.setHand(imageno);

            currentgame.setHands(currentImg);
            if (currentgame.checkHandBatting()) {
              //getting if wicket has falled
              showGeneralDialog(
                  context: context,
                  // background color
                  barrierDismissible: false,
                  // should dialog be dismissed when tapped outside
                  barrierLabel: "Dialog",
                  // label for barrier
                  transitionDuration: Duration(milliseconds: 10),
                  // how long it takes to popup dialog after button click
                  pageBuilder: (BuildContext context, _, __) =>
                      FallofWicketScreen(
                        pageName: Pg.BattingPage,
                      ));
            }
            //condi to end match if target reached
            if (currentgame.getScoreDiff() < 0) {
              print('Moving to MOS from battingpage');
              Navigator.pop(context);
              Navigator.pushNamed(context, '/MOS');
            }
          }
        });
      },
    );
  }
}
