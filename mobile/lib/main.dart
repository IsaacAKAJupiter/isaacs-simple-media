import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/categories.dart';
import 'package:isaacs_simple_media_mobile/routes/provision.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiConfig.loadApiUrl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Viewer',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
      ),
      home: ApiConfig.isProvisioned()
          ? const CategoriesRoute()
          : const ProvisionRoute(),
    );
  }
}
