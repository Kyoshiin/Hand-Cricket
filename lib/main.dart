import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/screens/openingtoss_page.dart';
import 'package:hand_cricket_flutter/screens/toss_page.dart';
import 'constants.dart';

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
        '/' : (context) => ChooseToss(),
        '/t' : (context) => TossPage(),
      },
    );
  }
}
