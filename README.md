# offset_and_size_calculate

A new Flutter project of indentify the offset and size of the widget.


 ![Sample UI](/preview.gif)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- Code Snippet

```
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
```

