import 'package:chasqui_frontend/screens/common/email_box.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:chasqui_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          addBackground(),
          addWelcomeText(context),
        ],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.asset(
        Constants.backgroundImage,
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText(BuildContext context) {
    return Column(
      children: <Widget>[
        FractionallySizedBox(
          alignment: Alignment.centerLeft, //text aligned to left side
          widthFactor: .6, //covers about half of the screen
          child: Padding(
            padding: EdgeInsets.only(left: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Constants.integration,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Pallete.blue4,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: Constants.welcomeTo,
                      style: TextStyle(fontSize: 60, color: Pallete.blue4),
                      children: [
                        TextSpan(
                            text: Constants.ftf,
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54))
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 20),
                  child: Text(
                    Constants.subscribeText,
                    style: TextStyle(fontFamily: 'Indie Flower'),
                  ),
                ),
                SizedBox(
                  height: 260,
                ), //Give some spacing
                EmailBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
