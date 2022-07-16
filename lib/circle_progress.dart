import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class circle_progress extends CustomPainter {
  double value;
  bool isAirQ;

  circle_progress(this.value, this.isAirQ);
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int maximumValue = isAirQ ? 300 : 100; // AirQ max is 50 and humidity is 100
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    // ignore: non_constant_identifier_names
    Paint AirQArc = Paint()
      ..strokeWidth = 14
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
//when a new sensor can be added
    /*Paint mq6Arc = Paint()
      ..strokeWidth = 14
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;*/

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 14;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (value / maximumValue);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, AirQArc);
  }
}
//isAirQ ? AirQArc : mq6Arc