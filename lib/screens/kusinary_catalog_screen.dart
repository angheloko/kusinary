import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_product_grid.dart';
import 'package:kusinary_app/widgets/kusinary_search_button.dart';

class KusinaryCatalogScreen extends StatelessWidget {
  static const routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snacks'),
        actions: [
          KusinarySearchButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: KusinaryProductGrid(),
      ),
    );
  }
}
