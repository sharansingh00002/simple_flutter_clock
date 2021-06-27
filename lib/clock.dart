import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/custom_clock_widget.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Center(
        child: Transform.rotate(
          angle: 135 * pi / 2,
          child: CustomPaint(
            painter: CustomClockWidget(),
            child: Container(
              height: 240,
              width: 240,
            ),
          ),
        ),
      ),
    );
  }
}
