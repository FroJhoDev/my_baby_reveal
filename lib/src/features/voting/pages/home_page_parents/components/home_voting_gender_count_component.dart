import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class HomeVotingGenderCountComponent extends StatelessWidget {
  final bool isBoy;
  final int voteCount;

  const HomeVotingGenderCountComponent({
    super.key,
    required this.isBoy,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
          color: isBoy ? Colors.blue.shade500 : Colors.pink.shade500,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.white, width: 8.0)),
      child: AnimatedFlipCounter(
        duration: const Duration(milliseconds: 250),
        value: voteCount,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
