import 'dart:convert';

import 'package:flutter/services.dart';

import 'api/freshbooks.dart';

class AppConfig {
  final String freshbooksClientId;
  final String freshbooksClientSecret;
  final String freshbooksAuthorizationnUrl;
  final String freshbooksAccessTokenUrl;
  final String freshbooksRedirectUrl;

  AppConfig(
      {this.freshbooksClientId,
      this.freshbooksClientSecret,
      this.freshbooksAuthorizationnUrl,
      this.freshbooksAccessTokenUrl,
      this.freshbooksRedirectUrl});

  static Future<AppConfig> forEnvironment(String env) async {
    env = env ?? 'dev';

    final contents = await rootBundle.loadString(
      'conf/application.$env.json',
    );

    final json = jsonDecode(contents);
    String clientId = json['freshbooks']['client_id'];
    String clientSecret = json['freshbooks']['client_secret'];
    String authorizationUrl = json['freshbooks']['authorization_url'];
    String accessTokenUrl = json['freshbooks']['access_token_url'];
    String redirectUrl = json['freshbooks']['redirect_url'];

    if (authorizationUrl == null ||
        accessTokenUrl == null ||
        redirectUrl == null) {
      throw Exception('freshbook configuration is missing settings');
    }

    return AppConfig(
        freshbooksClientId: clientId,
        freshbooksClientSecret: clientSecret,
        freshbooksAuthorizationnUrl: authorizationUrl,
        freshbooksAccessTokenUrl: accessTokenUrl,
        freshbooksRedirectUrl: redirectUrl);
  }

  Freshbooks freshbooks() {
    return Freshbooks.api(this);
  }
}
