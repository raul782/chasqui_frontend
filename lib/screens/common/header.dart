import 'package:chasqui_frontend/screens/home_screen.dart';
import 'package:chasqui_frontend/themes/pallete.dart';
import 'package:chasqui_frontend/utils/constants.dart';
import 'package:chasqui_frontend/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nav_items.dart';
import 'responsive.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var links = ["Home", "Github", "Videos", "Jobs"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(context), buildHeaderLinks(context)],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks(BuildContext context) {
    if (!Responsive.isSmallScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getLinksListing(context)..add(buildLoginButton(context)),
      );
    } else {
      return PopupMenuButton(
        //child: Image.network("assets/menu.png", width: 25, height: 25),
        child: Image.asset(Constants.menuImage, width: 25, height: 25),
        onSelected: (NavLinks value) {
          setState(() {
            openLink(value);
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<NavLinks>>[
          const PopupMenuItem(
              value: NavLinks.Home,
              child: Text(
                "Home",
                style:
                    TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 20),
              )),
          const PopupMenuItem(
              value: NavLinks.Github,
              child: Text(
                "Github",
                style:
                    TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 20),
              )),
          const PopupMenuItem(
              value: NavLinks.Videos,
              child: Text("Videos",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          const PopupMenuItem(
              value: NavLinks.Resources,
              child: Text("Resources",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          const PopupMenuItem(
              value: NavLinks.Jobs,
              child: Text("Jobs",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          PopupMenuItem(value: NavLinks.LogIn, child: buildLoginButton(context))
        ],
      );
    }
  }

  bool isNotNavLinksLogin(link) {
    return link != NavLinks.LogIn;
  }

  //Builds navigation list for header
  List<Widget> getLinksListing(BuildContext context) {
    return NavLinks.values.where((link) => link != NavLinks.LogIn).map((link) {
      return Padding(
          padding: EdgeInsets.only(left: 18),
          child: InkWell(
              hoverColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  displayString(link),
                  //style: Theme.of(context).textTheme.title,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ),
              onTap: () {
                openLink(link);
              }));
    }).toList();
  }

  void openLink(NavLinks link) async {
    if (link == NavLinks.Resources) {
      //open Resource page
      Navigator.pushNamed(context, HomeScreen.id);
    } else if (await canLaunch(getTargetUrl(link))) {
      //UrlUtils.open(getTargetUrl(link), name: displayString(link));
      //html.window.open(getTargetUrl(link), displayString(link));
      await UrlHelper.openLink(getTargetUrl(link));
    }
  }

  String getTargetUrl(NavLinks link) {
    String url = "";

    switch (link) {
      case NavLinks.Home:
        url = "https://flutter-to-fly.firebaseapp.com";
        break;

      case NavLinks.Github:
        url = "https://github.com/ptyagicodecamp";
        break;

      case NavLinks.Videos:
        url =
            "https://www.youtube.com/channel/UCO3_dbHasEnA2dr_U0EhMAA/videos?view_as=subscriber";
        break;

      case NavLinks.Jobs:
        url = "https://flutterjobs.info";
        break;

      default:
        url = "https://flutter-to-fly.firebaseapp.com";
    }

    return url;
  }

  //Builds and decorates login button
  Widget buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HomeScreen.id);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).accentColor,
                Theme.of(context).accentColor
              ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                Constants.loginButton,
                style: TextStyle(
                    color: Pallete.whitePrimary,
                    fontSize: 18,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: Center(
            child: Image.asset(Constants.logoImage),
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Constants.appTitle,
          style: TextStyle(fontFamily: 'Indie Flower', fontSize: 26),
        )
      ],
    );
  }
}
