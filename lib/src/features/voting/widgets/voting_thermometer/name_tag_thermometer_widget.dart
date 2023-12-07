import 'package:flutter/material.dart';

class NameTagThermometerWidget extends StatelessWidget {

  final String babyName;
  final bool isBoy;

  const NameTagThermometerWidget({
    super.key,
    required this.babyName,
    required this.isBoy,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Wrap(
          runSpacing: 10.0,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: babyName
              .toUpperCase()
              .split('')
              .map(
                (string) => Text(
                  string,
                  style: TextStyle(
                    // color: isBoy ? Colors.blue.shade50 : Colors.pink.shade50,
                    fontSize: 40.0,
                    fontFamily: 'LilitaOne',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color =
                          isBoy ? Colors.blue.shade100 : Colors.pink.shade100,
                  ),
                ),
              )
              .toList(),
        ),
        Wrap(
          runSpacing: 10.0,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: babyName
              .toUpperCase()
              .split('')
              .map(
                (string) => Text(
                  string,
                  style: TextStyle(
                      color: isBoy ? Colors.blue.shade50 : Colors.pink.shade50,
                      fontSize: 40.0,
                      fontFamily: 'LilitaOne'),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
