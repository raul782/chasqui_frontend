import 'package:chasqui_frontend/screens/common/header.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  static const String id = '/app/job';
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
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
              children: <Widget>[
                Header(),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Job',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Pallete.blue4,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
