import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void paintOneWave(
  Canvas canvas,
  Size size, {
  required double waveHeight,
  required double cyclicAnimationValue,
  required List<double> colorStops,
  required List<Color> colors,
}) {
  assert(colorStops.length == colors.length);

  Path path = Path();

  path.moveTo(0, waveHeight);

  for (var i = 0.0; i < size.width; i++) {
    path.lineTo(i, waveHeight + sin((i / size.width * 2 * pi) + (cyclicAnimationValue * 2 * pi)) * 8);
  }

  path.lineTo(size.width, size.height);
  path.lineTo(0, size.height);
  path.close();

  Paint paint = Paint();
  paint.shader = ui.Gradient.linear(
    const Offset(0, 0),
    Offset(0, size.height),
    colors,
    colorStops,
  );

  canvas.drawPath(path, paint);
}
