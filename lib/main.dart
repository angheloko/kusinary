import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_main_screen.dart';

void main() {
  runApp(KusinaryApp());
}

class KusinaryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kusinary',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KusinaryMainScreen(),
    );
  }
}
