import 'package:flutter/material.dart';

class WidgetPosition {
  final Size size;
  final Offset offset;

  WidgetPosition({
    required this.size,
    required this.offset,
  });

  double get dx => offset.dx;

  double get dy => offset.dy;

  double get width => size.width;

  double get height => size.height;
}

WidgetPosition getWidgetPositionByGlobalKey(GlobalKey key) {
  final box = key.currentContext!.findRenderObject() as RenderBox;
  final position = box.localToGlobal(Offset.zero);
  return WidgetPosition(size: box.size, offset: position);
}

WidgetPosition getWidgetPositionFromContext(BuildContext context) {
  final box = context.findRenderObject() as RenderBox;
  final position = box.localToGlobal(Offset.zero);
  return WidgetPosition(size: box.size, offset: position);
}


