import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

class KusinaryProductCard extends StatelessWidget {
  const KusinaryProductCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          Navigator.pushNamed(context, KusinaryProductDetailsScreen.routeName);
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: 16.0,
                  bottom: 16.0,
                  left: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₱1,000.00'),
                        Row(
                          children: [
                            Text('4.5'),
                            SizedBox(
                              width: 2.0,
                            ),
                            Icon(
                              Icons.star,
                              size: 16.0,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}