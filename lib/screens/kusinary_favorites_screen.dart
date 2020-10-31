import 'package:flutter/material.dart';

class KusinaryFavoritesScreen extends StatelessWidget {
  static const String routeName = 'favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
