import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClockWidget extends CustomPainter {
  int seconds = DateTime.now().second;
  int minutes = DateTime.now().minute;
  int hours = DateTime.now().hour;
  double hour = 0;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.width / 2;
    var radius = centerX;

    Paint fullCirlcePaint = Paint();
    fullCirlcePaint.color = Color.fromRGBO(198, 222, 244, 1);
    Offset circleOffset = Offset(centerX, centerY);
    canvas.drawCircle(circleOffset, radius, fullCirlcePaint);
    //outer circle
    Paint outerCirlcePaint = Paint();
    outerCirlcePaint.style = PaintingStyle.stroke;
    outerCirlcePaint.color = Colors.black;
    outerCirlcePaint.strokeWidth = 8;
    canvas.drawCircle(circleOffset, radius, outerCirlcePaint);
    //second hour
    double dx = radius + (radius * 0.75) * cos(seconds * 6 * pi / 180);
    double dy = radius + (radius * 0.75) * sin(seconds * 6 * pi / 180);
    Paint timePaint = Paint();
    timePaint.color = Colors.orangeAccent;
    timePaint.strokeCap = StrokeCap.round;
    timePaint.strokeWidth = 4;
    canvas.drawLine(circleOffset, Offset(dx, dy), timePaint);
    //minute hour
    dx = radius + (radius * 0.6) * cos(minutes * 6 * pi / 180);
    dy = radius + (radius * 0.6) * sin(minutes * 6 * pi / 180);
    timePaint.color = Colors.green;
    timePaint.strokeCap = StrokeCap.round;
    timePaint.strokeWidth = 6;
    canvas.drawLine(circleOffset, Offset(dx, dy), timePaint);
    //hour hour
    hours = hours > 24 ? hours ~/ 24 : hours;
    hour = hours + (minutes / 60);
    dx = radius + (radius * 0.4) * cos(hour * 30 * pi / 180);
    dy = radius + (radius * 0.4) * sin(hour * 30 * pi / 180);
    timePaint.color = Colors.blue;
    timePaint.strokeCap = StrokeCap.round;
    timePaint.strokeWidth = 8;
    canvas.drawLine(circleOffset, Offset(dx, dy), timePaint);

    // clock center
    fullCirlcePaint.color = Color.fromRGBO(234, 236, 254, 1);
    canvas.drawCircle(circleOffset, 8, fullCirlcePaint);
    //clock time dashed lines
    for (int i = 0; i < 360; i += 6) {
      double dx1 = radius + (radius - 8) * cos(i * pi / 180);
      double dy1 = radius + (radius - 8) * sin(i * pi / 180);

      double dx2 = radius + (radius - 16) * cos(i * pi / 180);
      double dy2 = radius + (radius - 16) * sin(i * pi / 180);

      Paint timePaint = Paint();
      timePaint.color = Colors.black;
      timePaint.strokeCap = StrokeCap.square;
      timePaint.strokeWidth = ((i / 6) % 5 == 0) ? 3 : 1;
      canvas.drawLine(Offset(dx1, dy1), Offset(dx2, dy2), timePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
