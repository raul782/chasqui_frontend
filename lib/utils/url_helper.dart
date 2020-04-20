import 'dart:html' as html;

class UrlHelper {
  static const String _self = '_self';
  //static const String _parent = '_parent';

  static html.Location currentLocation() {
    return html.window.location;
  }

  static queryParameters(String url) {
    return Uri.parse(url).queryParameters;
  }

  static html.WindowBase openWindow(String url, String name) {
    return html.window.open(url, name);
  }

  static Future<bool> openLink(String url) {
    return Future<bool>.value(openWindow(url, _self) != null);
  }
}
