import 'package:chasqui_frontend/api/freshbooks.dart';
import 'package:chasqui_frontend/app_module.dart';
import 'package:chasqui_frontend/screens/common/responsive.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:chasqui_frontend/utils/constants.dart';
import 'package:chasqui_frontend/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribeButton extends StatefulWidget {
  @override
  _SubscribeButtonState createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<SubscribeButton> {
  String url = '';
  void configureUrl() async {
    AppModule appModule =
        await Provider.of<Future<AppModule>>(context, listen: false);
    Freshbooks freshbooksApi = appModule.freshbooks();
    url = freshbooksApi.authorizeUrl();
  }

  @override
  void initState() {
    super.initState();
    configureUrl();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).secondaryHeaderColor
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).accentColor.withOpacity(.3),
                  offset: Offset(0, 8),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              UrlHelper.openLink(url);
            },
            child: Center(
              child: buildButton(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    if (Responsive.isSmallScreen(context))
      return buildSmallButton(context);
    else
      return buildLargeButton(context);
  }

  Widget buildLargeButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Constants.subscribeButton,
          style: TextStyle(
              color: Pallete.whitePrimary,
              fontSize: Responsive.isSmallScreen(context)
                  ? 12
                  : Responsive.isMediumScreen(context) ? 12 : 16,
              letterSpacing: 1),
        ),
        SizedBox(
          width: Responsive.isSmallScreen(context)
              ? 4
              : Responsive.isMediumScreen(context) ? 6 : 8,
        ),
        Icon(
          Icons.timer,
          color: Pallete.whitePrimary,
          size: Responsive.isSmallScreen(context)
              ? 12
              : Responsive.isMediumScreen(context) ? 12 : 20,
        ),
      ],
    );
  }

  Widget buildSmallButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          Constants.emailImage,
          color: Pallete.whitePrimary,
          width: Responsive.isSmallScreen(context)
              ? 12
              : Responsive.isMediumScreen(context) ? 12 : 20,
          height: Responsive.isSmallScreen(context)
              ? 12
              : Responsive.isMediumScreen(context) ? 12 : 20,
        )
      ],
    );
  }
}
