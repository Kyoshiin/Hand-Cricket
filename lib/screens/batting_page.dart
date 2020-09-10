import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/bowling_page.dart';
import 'package:hand_cricket_flutter/components/ImageHandler.dart';
import 'package:hand_cricket_flutter/components/HandArea.dart';
import 'package:hand_cricket_flutter/components/HeadingArea.dart';
import 'package:hand_cricket_flutter/components/ScoreArea.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'package:hand_cricket_flutter/screens/overlay_fallofWkts.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Scoreboard
            Scoreboard(currentgame),

            Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildHand(
                        heading: 'CPU HAND', Handno: currentImg.getCpuhand()),
                    buildHand(
                        heading: 'PLAYER HAND',
                        Handno: currentImg.getPlayerhand()),
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
                          BuildHeader(heading: 'YOUR CHOICES'),
                          Padding(
                            padding: EdgeInsets.all(Sc_width * kItempadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                createbtn(1),
                                createbtn(2),
                                createbtn(3),
                                createbtn(4),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: Sc_width * kItempadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
            ),
          ],
        ),
      ),
    );
  }

  Widget createbtn(int imageno) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
      child: Image.asset("images/$imageno.png", width: 50, height: 50),
      onPressed: () {
        setState(() {
          if (currentgame.getplayerWickets() != '0' &&
              currentgame.getScoreDiff(batting: 'cpu') >= 0) {
            currentImg.setHand(imageno);
            currentgame.setHands(currentImg);
            if(currentgame.checkHandBatting()){

              showGeneralDialog(
                context: context,// background color
                barrierDismissible: false, // should dialog be dismissed when tapped outside
                barrierLabel: "Dialog", // label for barrier
                transitionDuration: Duration(milliseconds: 10), // how long it takes to popup dialog after button click
                pageBuilder: (BuildContext context, _, __) =>
                    FallofWicketScreen());
                }


          }
          // ALL OUT
          else {
            if(currentgame.getcpuWickets()!= '0'){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BowlingPage()));
          }
            print("All out");
          }
        });
      },
    );
  }
}


