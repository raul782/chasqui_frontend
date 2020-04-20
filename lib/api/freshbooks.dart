import 'package:chasqui_frontend/app_config.dart';
import 'package:chasqui_frontend/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Freshbooks {
  static const String API_URL = 'https://api.freshbooks.com';

  final String clientId;
  final Uri authorizationURL;
  final Uri accessTokenURL;
  final String redirectURL;
  final String state;
  oauth2.Client _client;

  factory Freshbooks.api(AppConfig appConfig) {
    String state = Uuid().v4();

    return Freshbooks(
      clientId: appConfig.freshbooksClientId,
      authorizationURL: Uri.parse(appConfig.freshbooksAuthorizationnUrl),
      accessTokenURL: Uri.parse(appConfig.freshbooksAccessTokenUrl),
      redirectURL: appConfig.freshbooksRedirectUrl,
      state: state,
    );
  }

  Freshbooks({
    @required this.clientId,
    @required this.authorizationURL,
    @required this.accessTokenURL,
    @required this.redirectURL,
    @required this.state,
  });

  String authorizeUrl() {
    String queryParams =
        'client_id=$clientId&response_type=code&redirect_uri=$redirectURL&state=$state';

    return '${this.authorizationURL}?$queryParams';
  }

  Future<void> loadClient(Future<SharedPreferences> storageF) async {
    final SharedPreferences storage = await storageF;
    String token;
    if (storage.containsKey('freshbooks')) {
      token = storage.getString('freshbooks');
    } else {
      Map<String, String> query =
          UrlHelper.queryParameters(UrlHelper.currentLocation().href);
      print(UrlHelper.currentLocation().href);
      if (query.containsKey('code')) {
        token = query['code'];
      }
    }

    oauth2.AuthorizationCodeGrant grant = oauth2.AuthorizationCodeGrant(
        clientId, authorizationURL, accessTokenURL,
        secret: token);

    var parameters = {'state': state, 'code': token};

    _client = await grant.handleAuthorizationResponse(parameters);
  }

  Future<dynamic> getUser() {
    return _client.read('$API_URL/auth/api/v1/users/me');
  }
}
