import 'package:chasqui_frontend/screens/common/email_box.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:chasqui_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Constants.hello,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Pallete.blue4,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: Constants.welcomeTo,
                      style: TextStyle(fontSize: 40, color: Pallete.blue4),
                      children: [
                        TextSpan(
                            text: Constants.ftf,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54))
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    Constants.backgroundImage,
                    scale: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 20),
                  child: Text(
                    Constants.subscribeText,
                    style: TextStyle(fontFamily: 'Indie Flower'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                EmailBox(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
