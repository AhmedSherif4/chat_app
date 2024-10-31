import 'package:app_links/app_links.dart';

//! deep link manager
class DeepLinkManager {
  DeepLinkManager._privateConstructor();

  static final DeepLinkManager _instance =
      DeepLinkManager._privateConstructor();

  static DeepLinkManager get instance => _instance;

  late AppLinks _appLinks;
  void initDeepLink() async {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri uri) {
      final path = uri.path;
      final id = uri.queryParameters['id'];
      // print('Received deep link: $uri');
      // print('Path: $path');
      // print('id: $id');
      // navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
      //     builder: (context) => SplashScreen(
      //       path: path,
      //       id: id,
      //     )));
    });
  }
}



