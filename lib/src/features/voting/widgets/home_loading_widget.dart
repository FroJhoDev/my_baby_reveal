import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

class HomeLoadingWidget extends StatelessWidget {

  final double animationWidth;

  const HomeLoadingWidget({
    super.key,
    required this.animationWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.percentWidth(0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/baby_sleeping_animation.json', width: animationWidth),
            Text(
              'Aguarde...',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blueGrey.shade500,
                fontFamily: 'LilitaOne',
              ),
            )
          ],
        ),
      ),
    );
  }
}
