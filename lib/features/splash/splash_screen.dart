import 'package:flutter/material.dart';
import 'package:light_test/core/widgets/logo.dart';
import 'package:light_test/features/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context, LoginScreenRoute());
    });

    return const Scaffold(
      body: Center(
        child: Logo(),
      ),
    );
  }
}
