import 'package:chasqui_frontend/app_config.dart';

import 'api/freshbooks.dart';

class AppModule {
  final AppConfig appConfig;

  AppModule._(this.appConfig);

  factory AppModule.core(AppConfig appConfig) {
    assert(appConfig != null);
    return AppModule._(appConfig);
  }

  Freshbooks freshbooks() {
    return Freshbooks.api(appConfig);
  }
}
