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
          border: Border.all(
        color: Colors.white,
        width: 1,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            //score
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                'score'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sc_height * 0.014,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            //score details
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    cpuActionIcon, //current choice icon
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cpu: "),
                    Text(currentgame.getcpuRuns() +
                        '/' +
                        currentgame.getcpuWickets())
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    playerActionIcon, //current choice icon
                    SizedBox(
                      width: 5,
                    ),
                    Text("Player: "),
                    Text(
                      currentgame.getplayerRuns() +
                          '/' +
                          currentgame.getplayerWickets(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(currentgame.getMatchComments(Callingcontext)),
          ),
        ],
      ),
    );
  }
}
