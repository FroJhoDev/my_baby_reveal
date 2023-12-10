import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

import '../../voting/model/voting_information_model.dart';

class RevelationBabyInformations extends StatelessWidget {

  final bool wasRevealed;
  final VotingInformationModel votingInformation;

  const RevelationBabyInformations({
    super.key,
    required this.wasRevealed,
    required this.votingInformation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: wasRevealed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1800),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/baby_animation_reveal.json',
              width: context.percentWidth(0.2),
            ),
            Text(
              "É ${votingInformation.babyGender == 1 ? ' UM MENINO' : 'UMA MENINA'}",
              style: TextStyle(
                fontSize: 38.0,
                color: Colors.blueGrey.shade100,
                fontFamily: 'LilitaOne',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Dê as Boas-Vindas ao",
              style: TextStyle(
                fontSize: 34.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              votingInformation.boyName.toUpperCase(),
              style: const TextStyle(
                fontSize: 48.0,
                color: Colors.white,
                fontFamily: 'LilitaOne',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
