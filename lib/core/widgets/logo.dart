import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 45,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
