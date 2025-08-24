import 'dart:io';

import 'package:isaacs_simple_media_mobile/api_config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        if (!ApiConfig.allowSelfSignedCerts) return false;
        return ApiConfig.baseUrl.contains(host);
      };
  }
}
