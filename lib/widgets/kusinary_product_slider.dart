import 'package:flutter/material.dart';
import 'package:kusinary_app/constants/config.dart';
import 'package:kusinary_app/widgets/kusinary_product_card.dart';

class KusinaryProductSlider extends StatelessWidget {
  const KusinaryProductSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double portraitWidth = size.width < size.height ? size.width : size.height;

    // Aspect ratio: 2.25 / 3.
    double width = portraitWidth * .45;
    double height = (width * kAspectRatio['height']) / kAspectRatio['width'];

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: width,
                height: height,
                child: KusinaryProductCard(),
            ),
            SizedBox(
                width: width,
                height: height,
                child: KusinaryProductCard(),
            ),
            SizedBox(
                width: width,
                height: height,
                child: KusinaryProductCard(),
            ),
          ],
        ),
      ),
    );
  }
}