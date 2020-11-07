import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_product_grid.dart';

class KusinaryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return KusinaryProductGrid();
      },
    );
  }
}
