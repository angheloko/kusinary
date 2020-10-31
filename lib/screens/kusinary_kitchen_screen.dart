import 'package:flutter/material.dart';

class KusinaryKitchenScreen extends StatelessWidget {
  static const String routeName = 'kitchen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
