import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

class KusinaryHomeScreen extends StatelessWidget {
  final VoidCallback onNavigation;

  const KusinaryHomeScreen({Key key, this.onNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2.25 / 3,
          ),
          itemCount: 19,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () async {
                  await Navigator.pushNamed(context, KusinaryProductDetailsScreen.routeName);
                  this.onNavigation();
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
                                    Icon(
                                      Icons.star,
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text('4.5'),
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
          },
        );
      },
    );
  }
}
