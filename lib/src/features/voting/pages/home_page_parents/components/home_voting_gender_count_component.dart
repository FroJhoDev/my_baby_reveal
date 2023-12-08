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
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(
          color: isBoy ? Colors.blue.shade500 : Colors.pink.shade500,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.white, width: 8.0)),
      child: Text(
        voteCount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
