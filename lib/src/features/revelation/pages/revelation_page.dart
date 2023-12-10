import 'package:flutter/material.dart';

import '../../voting/model/voting_information_model.dart';

import '../components/revelation_baby_informations.dart';
import '../components/revelation_count_down_timer_component.dart';
import '../components/revelation_animated_background_component.dart';

class RevelationPage extends StatelessWidget {
  final VotingInformationModel votingInformation;

  RevelationPage({super.key, required this.votingInformation});

  final ValueNotifier<bool> wasRevealed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: ValueListenableBuilder(
        valueListenable: wasRevealed,
        builder: (_, value, __) {
          return Stack(
            children: [
              RevelationAnimatedBackgroundComponent(
                wasRevealed: wasRevealed.value,
                babyGender: votingInformation.babyGender,
              ),
              RevelationCountDownTimerComponent(
                wasRevealed: wasRevealed.value,
                onComplete: () {
                  wasRevealed.value = true;
                },
              ),
              RevelationBabyInformations(
                wasRevealed: wasRevealed.value,
                votingInformation: votingInformation,
              ),
            ],
          );
        },
      ),
    );
  }
}
