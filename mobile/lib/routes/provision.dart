import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/categories.dart';
import 'package:openapi/openapi.dart';

class ProvisionRoute extends StatefulWidget {
  const ProvisionRoute({super.key});

  @override
  State<ProvisionRoute> createState() => _ProvisionRouteState();
}

class _ProvisionRouteState extends State<ProvisionRoute> {
  final _textController = TextEditingController();
  bool _isChecking = false;

  @override
  void initState() {
    super.initState();
    _textController.text = ApiConfig.baseUrl;
  }

  void _saveUrl() async {
    if (_textController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a valid URL')));
      return;
    }

    setState(() {
      _isChecking = true;
    });

    bool success = false;
    try {
      final response = await AppApi(
        Dio(
          BaseOptions(
            baseUrl: _textController.text,
            connectTimeout: Duration(seconds: 3),
            sendTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
          ),
        ),
        standardSerializers,
      ).health();
      success = response.statusCode == 200;
    } catch (_) {
      //
    }

    if (!mounted) return;
    setState(() {
      _isChecking = false;
    });

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not connect to the API')),
      );
      return;
    }

    await ApiConfig.saveApiUrl(_textController.text);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CategoriesRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup API URL')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'API Base URL',
                hintText: 'http://localhost:3333',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 20),
            if (_isChecking)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _saveUrl,
                child: const Text('Save and Continue'),
              ),
          ],
        ),
      ),
    );
  }
}
