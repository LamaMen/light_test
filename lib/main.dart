import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/injection.dart';
import 'package:light_test/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        applyElevationOverlayColor: false,
        textTheme: const TextTheme(
          labelLarge: labelLarge,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
