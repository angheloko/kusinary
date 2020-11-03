import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KusinaryProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.blue,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.teal,
              shape: CircleBorder(),
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ]
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    size: 20.0,
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                              Text('4.5'),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₱1,000.00',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(width: 8.0),
                        Row(
                          children: [
                            Icon(Icons.group_outlined),
                            SizedBox(width: 4.0),
                            Text('Serves 10'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
