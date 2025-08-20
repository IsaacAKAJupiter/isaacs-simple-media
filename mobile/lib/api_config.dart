import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  static const String _apiUrlKey = 'api_url';
  static String _baseUrl = '';

  static String get baseUrl => _baseUrl;
  static Dio get dio => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 3),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  static Future<void> loadApiUrl() async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = prefs.getString(_apiUrlKey) ?? '';
  }

  static Future<void> saveApiUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiUrlKey, url);
    _baseUrl = url;
  }

  static bool isProvisioned() {
    return _baseUrl.isNotEmpty;
  }
}
