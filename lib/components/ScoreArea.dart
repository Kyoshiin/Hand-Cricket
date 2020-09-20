import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import '../constants.dart';
import 'enumPage.dart';

class Scoreboard extends StatelessWidget {
  Scoreboard(@required this.isPlayer, @required this.Callingcontext);

  final GameLogic currentgame = GameLogic();
  final String isPlayer;
  final Pg Callingcontext;
  double ScBrdIcSize = 20;

  @override
  Widget build(BuildContext context) {
    Image cpuActionIcon;
    Image playerActionIcon;

    Image batIcon = Image.asset('images/ic_bat.png',
        height: ScBrdIcSize, width: ScBrdIcSize);
    Image bowlIcon = Image.asset('images/ic_bowl.png',
        height: ScBrdIcSize, width: ScBrdIcSize);

    if (isPlayer == 'bat') {
      playerActionIcon = batIcon;
      cpuActionIcon = bowlIcon;
    } else {
      cpuActionIcon = batIcon;
      playerActionIcon = bowlIcon;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3)
            )
          ]),


      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

            alignment: Alignment.center,
            child: Text(
              'score'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sc_height * 0.02,
              ),
            ),
          ),

          //display score area
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  playerActionIcon, //current choice icon
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Player: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    currentgame.getplayerRuns() +
                        '/' +
                        currentgame.getplayerWickets(),
                    style: ScoreTextstyle
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text("Cpu: ",
                  style: NameTextstyle,),
                  Text(currentgame.getcpuRuns() +
                      '/' +
                      currentgame.getcpuWickets(),
                  style: ScoreTextstyle,),

                  SizedBox(
                    width: 5,
                  ),

                  cpuActionIcon, //current choice icon
                ],
              ),
            ],
          ),

          //comment section
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(currentgame.getMatchComments(Callingcontext),
            style: NameTextstyle,),
          ),
        ],
      ),
    );
  }
}
