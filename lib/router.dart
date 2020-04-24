import 'package:chasqui_frontend/screens/freshbooks_auth_screen.dart';
import 'package:chasqui_frontend/screens/github_screen.dart';
import 'package:chasqui_frontend/screens/home_screen.dart';
import 'package:chasqui_frontend/screens/job_screen.dart';
import 'package:chasqui_frontend/screens/time_tracking_screen.dart';
import 'package:chasqui_frontend/screens/video_screen.dart';
import 'package:flutter/material.dart';

const String homeTitle = 'Freshbook Connector';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print('[Router:generateRoute]' + routeSettings.name);

  String routeName = routeSettings.name.split('?').first;

  print('[Router:generateRoute:name]' + routeName);

  switch (routeName) {
    case HomeScreen.id:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(title: homeTitle),
          settings: routeSettings);
      break;

    case TimeTrackingScreen.id:
      return MaterialPageRoute(
          builder: (context) => TimeTrackingScreen(), settings: routeSettings);
      break;

    case FreshbooksAuthScreen.id:
      return MaterialPageRoute(
          builder: (context) => FreshbooksAuthScreen(),
          settings: routeSettings);
      break;
    case JobScreen.id:
      return MaterialPageRoute(
          builder: (context) => JobScreen(), settings: routeSettings);
      break;
    case GithubScreen.id:
      return MaterialPageRoute(
          builder: (context) => GithubScreen(), settings: routeSettings);
      break;

    case VideoScreen.id:
      return MaterialPageRoute(
          builder: (context) => VideoScreen(), settings: routeSettings);
      break;

    default:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(title: homeTitle),
          settings: routeSettings);
  }
}

Future<dynamic> navigateToHome(context) {
  return Navigator.pushNamed(context, HomeScreen.id);
}

Future<dynamic> goTo(BuildContext context, String routeName) {
  return Navigator.pushNamed(context, routeName);
}
