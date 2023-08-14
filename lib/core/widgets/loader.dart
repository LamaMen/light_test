import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';

class Loader extends StatelessWidget {
  const Loader(
    this.size, {
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 4,
        color: primary,
      ),
    );
  }
}
