import 'package:flutter/material.dart';

class KusinaryFavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.orange,
        ),
      ),
    );
  }
}
