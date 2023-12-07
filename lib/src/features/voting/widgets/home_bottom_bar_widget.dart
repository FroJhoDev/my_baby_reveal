import 'package:flutter/material.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.percentHeight(0.10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70.0),
            topRight: Radius.circular(70.0),
          ),
        ),
      ),
    );
  }
}
