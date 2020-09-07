import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/SelectionButton.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'package:hand_cricket_flutter/screens/batting_page.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int wickets = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Time to toss'.toUpperCase(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelecButton(ButtonName: 'BAT', ButtonAction: () {

                    GameLogic().setWickets(wickets);
                    //going to next screen
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => BattingPage()));
                  },),
                  //SelecButton(ButtonName: 'BOWL'),
                ],
              ),
              Column(
                children: [
                  Text('WICKETS',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    wickets.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    width: Sc_width*0.8,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.red[500],
                        overlayColor: Colors.red[900],
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                        value: wickets.toDouble(),
                        min: 1.0,
                        max: 6.0,
                        onChanged: (double newValue) {
                          setState(() {
                            wickets = newValue.floor();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


