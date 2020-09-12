import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import '../constants.dart';

class Scoreboard extends StatelessWidget {
  Scoreboard(@required this.isPlayer, @required this.currentgame);

  final GameLogic currentgame;
  final String isPlayer;
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
      margin: EdgeInsets.all(10),
      width: Sc_width * 0.3,
      height: Sc_width * 0.18,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.white,
        width: 2,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(0.001 * Sc_height),
              child: Text(
                'score'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sc_height * 0.014,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              cpuActionIcon,
              Text("Cpu:"),
              Text(currentgame.getcpuRuns() +
                  '/' +
                  currentgame.getcpuWickets())
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                playerActionIcon,
                Text("Player:"),
                Text(
                  currentgame.getplayerRuns() +
                      '/' +
                      currentgame.getplayerWickets(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
