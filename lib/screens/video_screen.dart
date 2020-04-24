import 'package:chasqui_frontend/screens/common/header.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  static const String id = '/app/video';
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
                                'Video',
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
