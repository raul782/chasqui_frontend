import 'package:chasqui_frontend/screens/common/header.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:flutter/material.dart';

class TimeTrackingScreen extends StatefulWidget {
  static const String id = '/app/tracking';
  @override
  _TimeTrackingScreenState createState() => _TimeTrackingScreenState();
}

class _TimeTrackingScreenState extends State<TimeTrackingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Pallete.whitePrimary, Pallete.whiteSecondary])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[Header()],
            ),
          ),
        ));
  }
}
