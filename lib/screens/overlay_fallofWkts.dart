import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FallofWicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(
          0.90),
      body: RawMaterialButton(
        splashColor: Colors.transparent,
        onPressed: (){
          Navigator.pop(context);
        },
        child: SizedBox.expand(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 2)
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'fall of wicket'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
