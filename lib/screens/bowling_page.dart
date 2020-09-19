import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/ImageHandler.dart';
import 'package:hand_cricket_flutter/components/HandArea.dart';
import 'package:hand_cricket_flutter/components/HeadingArea.dart';
import 'package:hand_cricket_flutter/components/enumPage.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'package:hand_cricket_flutter/screens/overlay_fallofWkts.dart';
import '../components/ScoreArea.dart';
import '../components/reset_dialog.dart';

GameLogic currentgame = GameLogic();
ImageHandler currentImg = ImageHandler();

class BowlingPage extends StatefulWidget {
  @override
  _BowlingPageState createState() => _BowlingPageState();
}

class _BowlingPageState extends State<BowlingPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => ResetAlertDialog(c), //argument -> buildContext
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //Scoreboard
              Expanded(
                  child: Padding(
                padding: ScoreBoardPadding,
                child: Scoreboard('bowl', Pg.BowlingPage),
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
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                      child: Column(
                        children: [
                          BuildHeader(heading: 'YOUR CHOICES FOR BOWLING'),
                          Padding(
                            padding: EdgeInsets.all(Sc_width * kItempadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                createbtn(1),
                                createbtn(2),
                                createbtn(3),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: Sc_width * kItempadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                createbtn(4),
                                createbtn(5),
                                createbtn(6),
                              ],
                            ),
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

      child: CircleAvatar(
        radius: 0.085 * Sc_width,
        backgroundColor: Colors.blue,       // for border
        child: CircleAvatar(
          radius: 0.075 * Sc_width,
          backgroundColor: Colors.white,
          child: Image.asset('images/$imageno.png',height: 50),
        ),
      ),
      //actions
      onPressed: () {
        setState(
          () {
            /** checking for cpu wkts (player bowl first) or
           * score diff (player bat first)
           */
            if (currentgame.getcpuWickets() != '0' &&
                currentgame.getScoreDiff() >= 0) {
              currentImg.setHand(imageno);
              currentgame.setHands(currentImg);
              if (currentgame.checkHandBowling()) {
                showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierLabel: "Dialog",
                    transitionDuration: Duration(milliseconds: 10),
                    pageBuilder: (BuildContext context, _, __) =>
                        FallofWicketScreen(pageName: Pg.BowlingPage));
              }
              //condi to end match if target reached
              if (currentgame.getScoreDiff() < 0) {
                Navigator.pop(context);
                print('Moving to MOS from BowlingPage');
                Navigator.pushNamed(context, '/MOS');
              }
            }
          },
        );
      },
    );
  }
}
