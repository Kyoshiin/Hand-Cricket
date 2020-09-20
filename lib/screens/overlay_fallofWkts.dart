import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/enumPage.dart';
import 'package:hand_cricket_flutter/screens/change_action_page.dart';

class FallofWicketScreen extends StatelessWidget {

  GameLogic currentgame = GameLogic();
  final Pg pageName;

  FallofWicketScreen({@required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.90),
      body: RawMaterialButton(
        splashColor: Colors.transparent,

        //FUNCTION OF PAGE
        onPressed: () {
          if ((currentgame.getplayerWickets() == '0' &&
              currentgame.getcpuWickets() == '0') ||
              currentgame.getScoreDiff() < 0) {
            Navigator.pop(context);
            print('Moving to MOS from FOWS');
            Navigator.pushNamed(context, '/MOS');
          }
          else if (currentgame.getplayerWickets() == '0' &&
              currentgame.getcpuWickets() != '0' && pageName==Pg.BattingPage) {
            Navigator.pop(context);
            print('Moving to bowling from FOWS');
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeAction(Pg.BattingPage)));
          }
          else if (currentgame.getplayerWickets() != '0' &&
              currentgame.getcpuWickets() == '0' && pageName==Pg.BowlingPage) {
            Navigator.pop(context);
            print('Moving to bat from FOWS');
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeAction(Pg.BowlingPage)));
          }
          else
            Navigator.pop(context);
        },


        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/out.png'),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'fall of wicket'.toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
