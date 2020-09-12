import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/screens/SelectionPage.dart';
import 'package:hand_cricket_flutter/screens/batting_page.dart';
import 'package:hand_cricket_flutter/screens/bowling_page.dart';

void main() {
  runApp(HandCricket());
}

class HandCricket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[600],
        scaffoldBackgroundColor: Colors.green[600]
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => SelectionPage(),
        '/bat':(context) => BattingPage(),
        '/bowl':(context) =>BowlingPage()
      },
    );
  }
}
