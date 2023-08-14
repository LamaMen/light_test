import 'package:flutter/material.dart';

@immutable
class ViewConfig {
  const ViewConfig.unselectable({
    required this.title,
    required this.image,
  })  : isSelectable = false,
        imageSelected = null,
        view = null;

  const ViewConfig.selectable({
    required this.title,
    required this.image,
    required Widget this.view,
    required String this.imageSelected,
  }) : isSelectable = true;

  final String title;
  final String image;
  final bool isSelectable;
  final String? imageSelected;
  final Widget? view;
}
