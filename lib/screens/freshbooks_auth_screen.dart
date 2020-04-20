import 'package:chasqui_frontend/app_module.dart';
import 'package:chasqui_frontend/router.dart' as router;
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreshbooksAuthScreen extends StatefulWidget {
  static const String id = '/app/freshbooks/auth';
  @override
  _FreshbooksAuthScreenState createState() => _FreshbooksAuthScreenState();
}

class _FreshbooksAuthScreenState extends State<FreshbooksAuthScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> grantAuth() async {
    AppModule appModule =
        await Provider.of<Future<AppModule>>(context, listen: false);

    try {
      await appModule.freshbooks().loadClient(_prefs);
      var user = appModule.freshbooks().getUser();
      print(user.toString());
    } catch (error) {
      print(error.toString());
      await router.navigateToHome(context);
    }
  }

  @override
  void initState() {
    super.initState();
    grantAuth();
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
              children: <Widget>[],
            ),
          ),
        ));
  }
}
