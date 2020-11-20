import 'package:flutter/material.dart';
import 'package:kusinary_app/constants/config.dart';
import 'package:kusinary_app/widgets/kusinary_product_card.dart';

class KusinaryProductGrid extends StatelessWidget {
  const KusinaryProductGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: kAspectRatio['width'] / kAspectRatio['height'],
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return KusinaryProductCard();
      },
    );
  }
}
