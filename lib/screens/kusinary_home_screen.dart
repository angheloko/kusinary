import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

class KusinaryHomeScreen extends StatelessWidget {
  final VoidCallback onNavigation;

  const KusinaryHomeScreen({Key key, this.onNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2.3 / 3,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodyText2.copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
