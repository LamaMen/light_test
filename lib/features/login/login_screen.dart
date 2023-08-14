import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/widgets/buttons.dart';
import 'package:light_test/core/widgets/logo.dart';
import 'package:light_test/features/main/main_screen.dart';
import 'package:light_test/features/onboarding/onboarding_screen.dart';

class LoginScreenRoute extends CupertinoPageRoute {
  LoginScreenRoute() : super(builder: (_) => const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Logo(),
              ),
            ),
            SimpleButton(
              onPressed: () {
                Navigator.pushReplacement(context, MainScreenRoute());
                Navigator.push(context, OnboardingScreenRoute());
              },
              child: const Text('Войти через ЕЛК', style: labelLarge),
            ),
            const SizedBox(height: 16),
            SimpleButton(
              onPressed: () {
                Navigator.pushReplacement(context, MainScreenRoute());
                Navigator.push(context, OnboardingScreenRoute());
              },
              color: secondary,
              child: Text(
                'Войти без авторизации',
                style: labelLarge.copyWith(color: primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
