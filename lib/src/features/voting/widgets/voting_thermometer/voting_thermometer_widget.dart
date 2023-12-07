import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

import 'animated_wave_paint_widget.dart';
import 'name_tag_thermometer_widget.dart';

class VotingThermometerWidget extends StatelessWidget {
  final double voteCount;
  final bool isBoy;
  final String babyName;

  const VotingThermometerWidget({super.key, required this.voteCount, required this.isBoy, required this.babyName});

  @override
  Widget build(BuildContext context) {
    final maxHeight = context.percentHeight(0.8);
    final maxWidth = min(200.0, context.screenWidth / 2 - 30);

    final maxContainerFilledHeight = maxHeight - 60.0;
    final maxContainerFilledWidth = maxWidth - 20.0;

    return SizedBox(
      height: maxHeight,
      width: maxWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: maxContainerFilledHeight,
            width: maxContainerFilledWidth,
            decoration: BoxDecoration(
                color: isBoy ? Colors.blue.shade50 : Colors.pink.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                border: Border.all(
                  color: isBoy ? Colors.blue.shade50 : Colors.pink.shade50,
                ),
                boxShadow: [
                  BoxShadow(
                      color:
                          isBoy ? Colors.blue.shade100 : Colors.pink.shade100,
                      blurRadius: 20.0)
                ]),
            clipBehavior: Clip.antiAlias,
            child: AnimatedWavePaintWidget(voteCount: voteCount, isBoy: isBoy),
          ),
          NameTagThermometerWidget(babyName: babyName, isBoy: isBoy),
        ],
      ),
    );
  }
}
