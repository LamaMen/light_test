import 'package:flutter/material.dart';

class DotIndicators extends StatelessWidget {
  const DotIndicators({
    super.key,
    required this.count,
    required this.current,
    required this.color,
    required this.secondary,
  });

  final int count;
  final int current;
  final Color color;
  final Color secondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final isActive = current == i;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 16 : 8,
          decoration: BoxDecoration(
            color: isActive ? color : secondary,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        );
      }),
    );
  }
}
