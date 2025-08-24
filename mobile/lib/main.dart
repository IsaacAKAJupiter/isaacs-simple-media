import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/app_theme.dart';
import 'package:isaacs_simple_media_mobile/http_overrides.dart';
import 'package:isaacs_simple_media_mobile/routes/unlocking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiConfig.load();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Media Viewer',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const UnlockingRoute(),
    );
  }
}
