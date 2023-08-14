import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.child,
    required this.onPressed,
    Color? color,
    bool? isExpand,
    EdgeInsetsGeometry? padding,
    double? radius,
  })  : color = color ?? primary,
        isExpand = isExpand ?? true,
        padding = padding ?? const EdgeInsets.symmetric(vertical: 18),
  radius = radius ?? 12;

  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsetsGeometry padding;
  final bool isExpand;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: isExpand ? double.infinity : null,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
