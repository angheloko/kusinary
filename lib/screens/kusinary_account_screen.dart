import 'package:flutter/material.dart';

class KusinaryAccountScreen extends StatelessWidget {
  static const String routeName = 'account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        color: Colors.pink,
      ),
    );
  }
}
