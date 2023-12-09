import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:lottie/lottie.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

import '../../voting/model/voting_information_model.dart';

class RevelationPage extends StatelessWidget {
  final VotingInformationModel votingInformation;

  RevelationPage({
    super.key,
    required this.votingInformation,
  });

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
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInCirc,
                    width: wasRevealed.value ? context.screenWidth : 0.0,
                    height: wasRevealed.value ? context.screenHeight : 0.0,
                    decoration: BoxDecoration(
                      color: votingInformation.babyGender == 1
                          ? Colors.blue.shade500
                          : Colors.pink.shade500,
                      borderRadius:
                          BorderRadius.circular(wasRevealed.value ? 0 : 500),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: !wasRevealed.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Center(
                    child: CircularCountDownTimer(
                      duration: 10,
                      initialDuration: 0,
                      controller: CountDownController(),
                      width: context.percentWidth(0.15),
                      height: context.percentWidth(0.15),
                      ringColor: Colors.white30,
                      ringGradient: null,
                      fillColor: Colors.purpleAccent,
                      fillGradient: null,
                      backgroundColor: Colors.purple[500],
                      backgroundGradient: null,
                      strokeWidth: 20.0,
                      strokeCap: StrokeCap.round,
                      textStyle: const TextStyle(
                        fontFamily: 'LilitaOne',
                        fontSize: 33.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.S,
                      isReverse: true,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        debugPrint('Countdown Ended');
                        wasRevealed.value = true;
                      },
                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
                      timeFormatterFunction:
                          (defaultFormatterFunction, duration) {
                        if (duration.inSeconds == 0) {
                          return "Vamos Lá!";
                        } else {
                          return Function.apply(
                              defaultFormatterFunction, [duration]);
                        }
                      },
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: wasRevealed.value ? 1.0 : 0.0,
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
                ),
              ],
            );
          }),
    );
  }
}
