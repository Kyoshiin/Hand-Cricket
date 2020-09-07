import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/components/SelectionButton.dart';
import 'package:hand_cricket_flutter/constants.dart';
import 'package:hand_cricket_flutter/screens/SelectionPage.dart';
import 'package:hand_cricket_flutter/screens/toss_page.dart';

class ChooseToss extends StatefulWidget {
  @override
  _ChooseTossState createState() => _ChooseTossState();
}

class _ChooseTossState extends State<ChooseToss> {

  @override
  Widget build(BuildContext context) {

    Sc_width = MediaQuery.of(context).size.width;
    Sc_height = MediaQuery.of(context).size.height;

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
                  SelecButton(
                    ButtonName: 'HEADS',
                    ButtonAction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectionPage()));
                    },
                  ),
                  SelecButton(
                    ButtonName: 'TAILS',
                    ButtonAction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectionPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
