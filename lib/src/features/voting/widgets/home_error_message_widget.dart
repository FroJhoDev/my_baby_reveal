import 'package:flutter/material.dart';

class HomeErrorMessageWidget extends StatelessWidget {
  const HomeErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Um erro ocorreu ao resgatar as informações, feche o app e tente novamente!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueGrey.shade500),
      ),
    );
  }
}
