import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/categories.dart';
import 'package:isaacs_simple_media_mobile/routes/provision.dart';
import 'package:local_auth/local_auth.dart';

class UnlockingRoute extends StatefulWidget {
  const UnlockingRoute({super.key});

  @override
  State<UnlockingRoute> createState() => _UnlockingRouteState();
}

class _UnlockingRouteState extends State<UnlockingRoute> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _checkAuthAndNavigate(),
    );
  }

  Future<void> _checkAuthAndNavigate() async {
    if (!ApiConfig.isProvisioned()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProvisionRoute()),
      );
      return;
    }

    if (!ApiConfig.biometricUnlocking) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CategoriesRoute()),
      );
      return;
    }

    await _authenticate();
  }

  Future<void> _authenticate() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to open the app',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if (didAuthenticate && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CategoriesRoute()),
        );
      } else {
        SystemNavigator.pop();
      }
    } on PlatformException {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
