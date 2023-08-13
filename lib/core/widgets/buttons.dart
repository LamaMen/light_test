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
  })  : color = color ?? primary,
        isExpand = isExpand ?? true,
        padding = padding ?? const EdgeInsets.fromLTRB(10, 20, 10, 20);

  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsetsGeometry padding;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _style,
        child: child,
      ),
    );
  }

  ButtonStyle get _style {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(padding),
      backgroundColor: MaterialStateProperty.all<Color?>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(border),
    );
  }
}
