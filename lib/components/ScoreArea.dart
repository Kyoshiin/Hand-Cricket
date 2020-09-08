import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import '../constants.dart';

class Scoreboard extends StatelessWidget {
  Scoreboard(@required this.currentgame);

  final GameLogic currentgame;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: Sc_width*0.25,
      height: Sc_width*0.15,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(0.001*Sc_height),
          child: Text('score'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sc_height*0.014,
            ),),
        ),
      ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text("Player: "+currentgame.getplayerRuns()+'/'+currentgame.getplayerWickets()),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(3, 0, 0,3),
            child: Text("Cpu:   "+currentgame.getcpuRuns()+'/'+currentgame.getcpuWickets()),
          ),
        ],
      ),
    );
  }
}