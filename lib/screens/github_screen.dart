import 'package:chasqui_frontend/screens/common/header.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:flutter/material.dart';

class GithubScreen extends StatefulWidget {
  static const String id = '/app/github';
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
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
                                'Github',
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
