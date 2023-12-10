import 'package:flutter/material.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

class RevelationAnimatedBackgroundComponent extends StatelessWidget {
  final bool wasRevealed;
  final int babyGender;

  const RevelationAnimatedBackgroundComponent({
    super.key,
    required this.wasRevealed,
    required this.babyGender,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInCirc,
        width: wasRevealed ? context.screenWidth : 0.0,
        height: wasRevealed ? context.screenHeight : 0.0,
        decoration: BoxDecoration(
          color: babyGender == 1 ? Colors.blue.shade500 : Colors.pink.shade500,
          borderRadius: BorderRadius.circular(wasRevealed ? 0 : 500),
        ),
      ),
    );
  }
}
