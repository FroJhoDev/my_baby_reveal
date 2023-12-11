import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeVotingButtonComponent extends StatefulWidget {
  final bool isBoy;
  final Function()? onPressed;

  const HomeVotingButtonComponent({
    super.key,
    required this.isBoy,
    this.onPressed,
  });

  @override
  State<HomeVotingButtonComponent> createState() => _HomeVotingButtonComponentState();
}

class _HomeVotingButtonComponentState extends State<HomeVotingButtonComponent> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor:
                widget.isBoy ? Colors.blue.shade500 : Colors.pink.shade500,
            padding: const EdgeInsets.all(28.0),
            foregroundColor: Colors.white,
            iconSize: 40,
            side: const BorderSide(
              color: Colors.white,
              width: 8.0,
            ),
          ),
          icon: const Icon(Icons.plus_one),
          onPressed: (() {
            widget.onPressed!();
            _animationController.reset();
            _animationController.forward();
          }),
        ),
        IgnorePointer(
          ignoring: true,
          child: LottieBuilder.asset(
            widget.isBoy 
            ? 'assets/lottie/touch_buttom_boy_animation.json' 
            : 'assets/lottie/touch_buttom_girl_animation.json',
            fit: BoxFit.contain,
            controller: _animationController,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
