import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_config.dart';
import 'app_module.dart';
import 'router.dart' as router;
import 'screens/home_screen.dart';
import 'themes/theme_factory.dart';

AppModule appModule;

Future<AppModule> getAppModule() async {
  AppConfig appConfig =
      await AppConfig.forEnvironment('dev'); //TODO refactor env
  return AppModule.core(appConfig);
}

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<Future<AppModule>>(
        create: (_) {
          return getAppModule();
        },
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chasqui App',
      theme: ThemeFactory.fbTheme(context),
      home: HomeScreen(title: 'Freshbook Connector'),
      initialRoute: HomeScreen.id,
      onGenerateRoute: router.generateRoute,
    );
  }
}
