import 'package:flutter/material.dart';
import 'package:testing/clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      routes: {
        '/': (context) => Clock(),
      },
    );
  }
}
