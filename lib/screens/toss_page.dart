import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///F:/AndroidStudioProjects/Professional_proj/hand_cricket_flutter/lib/components/ImageHandler.dart';
import 'package:hand_cricket_flutter/components/HandArea.dart';
import 'package:hand_cricket_flutter/components/HeadingArea.dart';
import 'package:hand_cricket_flutter/constants.dart';

class TossPage extends StatefulWidget {
  @override
  _TossPageState createState() => _TossPageState();
}

class _TossPageState extends State<TossPage> {

  ImageHandler currentImg = ImageHandler();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: EdgeInsets.only(top:Sc_width*0.05),
                child: buildHand(
                    heading: 'CPU HAND',
                    Handno: currentImg.getCpuhand()),
              ),
              buildHand(
                  heading: 'PLAYER HAND',
                  Handno: currentImg.getPlayerhand()),
              //3rd row
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
                child: Column(
                  children: [
                    BuildHeader(heading: 'YOUR CHOICES'),
                    Padding(
                      padding: EdgeInsets.all(Sc_width*kItempadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          createbtn(1),
                          createbtn(2),
                          createbtn(3),
                          createbtn(4),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Sc_width*kItempadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          createbtn(5),
                          createbtn(6),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              GestureDetector(
                child: Container(
                  child: Center(
                    child: Text('PLAY'),
                  ),
                  color: Colors.red,
                  width: double.infinity,
                  height: Sc_height*0.07,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createbtn(int imageno) {
    return RawMaterialButton(
      child: Image.asset("images/$imageno.png", width: 50, height: 50),
      onPressed: () {
        setState(() {
          currentImg.setHand(imageno);
        });
      },
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
