import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_product_slider.dart';

class KusinaryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildNewProducts(context),
    );
  }

  Widget _buildNewProducts(BuildContext context) {
    return Container(
      child: KusinaryProductSlider(),
    );
  }
}
