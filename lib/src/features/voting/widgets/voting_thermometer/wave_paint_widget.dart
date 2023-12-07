import 'package:flutter/material.dart';
import 'package:my_baby_reveal/src/features/voting/widgets/voting_thermometer/paint_one_wave_widget.dart';

class WavePaintWidget extends CustomPainter {
  final double animation;
  final double voteCountReduced;
  final bool isBoy;

  WavePaintWidget({
    required this.animation,
    required this.voteCountReduced,
    required this.isBoy,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final waveHeight = size.height - voteCountReduced * size.height;
    final paintColorStops = [0.0, 0.2, 0.4, 0.6, 0.8];

    paintOneWave(
      canvas,
      size,
      waveHeight: waveHeight,
      cyclicAnimationValue: (1 - animation),
      colorStops: paintColorStops,
      colors: isBoy
        ? [
            Colors.blue.shade50,
            Colors.lightBlue.shade100,
            Colors.lightBlue.shade200,
            Colors.lightBlue.shade300,
            Colors.lightBlue.shade400,
          ]
        : [
            Colors.red.shade200,
            Colors.pink.shade50,
            Colors.pink.shade200,
            Colors.pink.shade200,
            Colors.pink.shade300,
          ],
    );

    paintOneWave(
      canvas,
      size,
      waveHeight: waveHeight,
      cyclicAnimationValue: animation,
      colorStops: paintColorStops,
      colors: isBoy
        ? [
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500,
          ]
        : [
            Colors.pink.shade100,
            Colors.pink.shade200,
            Colors.pink.shade300,
            Colors.pink.shade400,
            Colors.pink.shade500,
          ],
    );
  }

  @override
  bool shouldRepaint(WavePaintWidget oldDelegate) =>
      animation != oldDelegate.animation ||
      voteCountReduced != oldDelegate.voteCountReduced;

  @override
  bool shouldRebuildSemantics(WavePaintWidget oldDelegate) => false;
}
