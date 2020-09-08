import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/ImageHandler.dart';
import 'package:hand_cricket_flutter/components/HandArea.dart';
import 'package:hand_cricket_flutter/components/HeadingArea.dart';
import 'package:hand_cricket_flutter/constants.dart';

import 'components/ScoreArea.dart';

GameLogic currentgame = GameLogic();
ImageHandler currentImg = ImageHandler();

class BowlingPage extends StatefulWidget {
  @override
  _BowlingPageState createState() => _BowlingPageState();
}

class _BowlingPageState extends State<BowlingPage> {
  @override
  Widget build(BuildContext context) {
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
          if (currentgame.getcpuWickets() != '0' && currentgame.getScoreDiff()>=0) {
            currentImg.setHand(imageno);
            currentgame.setHands(currentImg);
            currentgame.checkHandBowling();
          } else {
            print('GAME OVER');
          }
        });
      },
    );
  }
}