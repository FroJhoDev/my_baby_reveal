import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';


class RevelationCountDownTimerComponent extends StatelessWidget {

  final bool wasRevealed;
  final Function()? onComplete;

  const RevelationCountDownTimerComponent({
    super.key,
    required this.wasRevealed,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !wasRevealed ? 1.0 : 0.0,
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
          onComplete: onComplete,
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            if (duration.inSeconds == 0) {
              return "Vamos Lá!";
            } else {
              return Function.apply(defaultFormatterFunction, [duration]);
            }
          },
        ),
      ),
    );
  }
}
