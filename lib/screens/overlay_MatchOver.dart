import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/screens/SelectionPage.dart';


class MatchOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(
          0.85),
      body: RawMaterialButton(
        splashColor: Colors.transparent,
        onPressed: (){
          Navigator.pop(context);
          GameLogic().reset();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectionPage()));
        },
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'MATCH OVER'.toUpperCase(),
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              Text(
                GameLogic().getMatchResults(),
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
