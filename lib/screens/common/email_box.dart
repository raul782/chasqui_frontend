import 'package:chasqui_frontend/screens/common/responsive.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:chasqui_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

import 'subscribe_button.dart';

class EmailBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 4.0,
          right: Responsive.isSmallScreen(context) ? 4 : 74,
          top: 10,
          bottom: 40),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Pallete.whitePrimary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Constants.email_hint,
                      hintStyle: TextStyle(fontFamily: 'Fresca', fontSize: 18)),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Pallete.greenPrimary,
                      secondaryHeaderColor: Pallete.greenPrimary,
                      accentColor: Pallete.bluePrimary,
                    ),
                    child: SubscribeButton(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
