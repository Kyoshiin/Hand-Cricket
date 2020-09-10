import 'package:flutter/material.dart';

class FallofWicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(
          0.85),
      body: RawMaterialButton(
        splashColor: Colors.transparent,
        onPressed: (){
          Navigator.pop(context);
        },
        child: SizedBox.expand(
          child: Center(
            child: Text(
              'fall of wicket'.toUpperCase(),
            ),
          ),
        ),
      ),
    );
  }
}
