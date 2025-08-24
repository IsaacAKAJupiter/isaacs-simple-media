import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  static const String _apiUrlKey = 'api_url';
  static const String _allowSelfSignedCertsKey = 'allow_self_signed_certs';
  static const String _biometricUnlockingKey = 'biometric_unlocking';
  static String _baseUrl = '';
  static bool _allowSelfSignedCerts = false;
  static bool _biometricUnlocking = false;

  static String get baseUrl => _baseUrl;
  static bool get allowSelfSignedCerts => _allowSelfSignedCerts;
  static bool get biometricUnlocking => _biometricUnlocking;

  static Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 3),
        sendTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) {
        if (!_allowSelfSignedCerts) return false;
        return _baseUrl.contains(host);
      };
      return client;
    };

    return dio;
  }

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = prefs.getString(_apiUrlKey) ?? '';
    _allowSelfSignedCerts = prefs.getBool(_allowSelfSignedCertsKey) ?? false;
    _biometricUnlocking = prefs.getBool(_biometricUnlockingKey) ?? false;
  }

  static Future<void> save({
    required final String url,
    required final bool allowSelfSignedCerts,
    required final bool biometricUnlocking,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiUrlKey, url);
    await prefs.setBool(_allowSelfSignedCertsKey, allowSelfSignedCerts);
    await prefs.setBool(_biometricUnlockingKey, biometricUnlocking);
    _baseUrl = url;
  }

  static bool isProvisioned() {
    return _baseUrl.isNotEmpty;
  }
}
