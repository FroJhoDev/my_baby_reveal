import 'package:flutter/material.dart';

import 'wave_paint_widget.dart';

class AnimatedWavePaintWidget extends StatefulWidget {
  final double voteCount;
  final bool isBoy;

  const AnimatedWavePaintWidget({
    super.key,
    required this.voteCount,
    required this.isBoy,
  });

  @override
  State<AnimatedWavePaintWidget> createState() => _AnimatedWavePaintWidgetState();
}

class _AnimatedWavePaintWidgetState extends State<AnimatedWavePaintWidget> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animation, builder: (context, _) {
      return CustomPaint(
        painter: WavePaintWidget(
          animation: _animation.value,
          voteCountReduced: widget.voteCount,
          isBoy: widget.isBoy,
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
