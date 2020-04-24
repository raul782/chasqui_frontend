import 'package:chasqui_frontend/screens/github_screen.dart';
import 'package:chasqui_frontend/screens/home_screen.dart';
import 'package:chasqui_frontend/screens/job_screen.dart';
import 'package:chasqui_frontend/screens/video_screen.dart';

enum NavLinks { Home, Github, Videos, Resources, Jobs, LogIn }

String displayString(NavLinks link) {
  switch (link) {
    case NavLinks.Home:
      return "Home";
      break;

    case NavLinks.Github:
      return "Github";
      break;
    case NavLinks.Videos:
      return "Videos";
      break;

    case NavLinks.Jobs:
      return "Jobs";
      break;

    case NavLinks.LogIn:
      return "LogIn";
      break;

    case NavLinks.Resources:
      return "Resources";
      break;

    default:
      return "";
  }
}

String linkRoute(NavLinks link) {
  switch (link) {
    case NavLinks.Github:
      return GithubScreen.id;
    case NavLinks.Jobs:
      return JobScreen.id;
    case NavLinks.Videos:
      return VideoScreen.id;
    default:
      return HomeScreen.id;
  }
}

String linkUrl(NavLinks link) {
  switch (link) {
    case NavLinks.Home:
      return "https://flutter-to-fly.web.app/";
      break;

    case NavLinks.Github:
      return "https://github.com/ptyagicodecamp";
      break;
    case NavLinks.Videos:
      return "https://www.youtube.com/channel/UCO3_dbHasEnA2dr_U0EhMAA?view_as=subscriber";
      break;

    case NavLinks.Jobs:
      return "https://flutterjobs.info/jobs/all";
      break;

    default:
      return "";
  }
}
