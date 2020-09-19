import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hand_cricket_flutter/Game_Logic.dart';
import 'package:hand_cricket_flutter/components/SelectionButton.dart';
import 'package:hand_cricket_flutter/components/exit_dialog.dart';
import 'package:hand_cricket_flutter/components/icon_content.dart';
import 'package:hand_cricket_flutter/constants.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int wickets = 3;
  String choice = "";

  @override
  Widget build(BuildContext context) {
    GameLogic tmpGL = GameLogic();
    Sc_width = MediaQuery.of(context).size.width;
    Sc_height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => ExitAlertDialog(context),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Time to choose'.toUpperCase(),
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelecButton(
                    icondetails: IconContent(label: 'bat'),
                    ButtonAction: () {
                      setState(() {
                        choice = 'bat';
                      });
                    },
                    color: choice == 'bat' ? active : inactive,
                  ),
                  SelecButton(
                    icondetails: IconContent(label: 'bowl'),
                    ButtonAction: () {
                      setState(() {
                        choice = 'bowl';
                      });
                    },
                    color: choice == 'bowl' ? active : inactive,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'WICKETS',
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
                    width: Sc_width * 0.8,
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
                        max: 11.0,
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
              RawMaterialButton(
                onPressed: () {
                  tmpGL.setPLayerChoice(choice);
                  tmpGL.setWickets(wickets);
                  if (choice == "")
                    Fluttertoast.showToast(
                        msg: 'Select Action', toastLength: Toast.LENGTH_SHORT);
                  else {
                    Navigator.pushNamed(
                        context, '/$choice'); //moving to selected page
                    choice = "";
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text('DONE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
