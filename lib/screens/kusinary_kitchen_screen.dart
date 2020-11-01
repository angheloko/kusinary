import 'package:flutter/material.dart';

class KusinaryKitchenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
