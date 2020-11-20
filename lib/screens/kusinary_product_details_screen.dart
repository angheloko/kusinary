import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KusinaryProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1432139555190-58524dae6a55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTitle(context),
                  SizedBox(height: 16.0),
                  _buildPricing(context),
                  SizedBox(height: 16.0),
                  _buildMessageButton(context),
                  SizedBox(height: 40.0),
                  _buildIngredients(context),
                  SizedBox(height: 40.0),
                  _buildDeliveryOptions(context),
                  SizedBox(height: 40.0),
                  _buildKitchenInfo(context),
                  SizedBox(height: 40.0),
                  _buildReviews(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            style: textTheme.headline6,
          ),
          SizedBox(height: 4.0),
          Text(
            'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            style: textTheme.caption,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildPricing(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '₱1,000.00',
                    style: textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Good for 10',
                        style: textTheme.caption,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(
                        Icons.group,
                        size: 16.0,
                        color: textTheme.caption.color,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('4.0'),
                      SizedBox(width: 4.0,),
                      Icon(Icons.star),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '10 reviews',
                    style: textTheme.caption,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageButton(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    return TextButton(
      onPressed: () {},
      child: Text('Contact kitchen'),
      style: flatButtonStyle,
    );
  }

  Widget _buildIngredients(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptions(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery and meet-up options',
                style: textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person_pin,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meet-up',
                    style: textTheme.bodyText1,
                  ),
                  Text(
                    'Makati City, Metro Manila',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.moped,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery',
                    style: textTheme.bodyText1,
                  ),
                  Text('₱100.00'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKitchenInfo(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About the kitchen',
                style: textTheme.subtitle1,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: textTheme.bodyText1,
                  ),
                  Text('Makati City, Metro Manila'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.smartphone,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone number',
                    style: textTheme.bodyText1,
                  ),
                  Text('888-8888'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.email,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: textTheme.bodyText1,
                  ),
                  Text('adobomasters@gmail.com'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.public,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Website',
                    style: textTheme.bodyText1,
                  ),
                  Text('www.adobomasters.com'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.public,
                size: 20.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facebook',
                    style: textTheme.bodyText1,
                  ),
                  Text('/adobomasters'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviews(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: textTheme.subtitle1,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Placeholder(
                      fallbackWidth: 20.0,
                      fallbackHeight: 20.0,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Adobo lover',
                      style: textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star_outline,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '12/12/2020',
                      style: textTheme.bodyText2.copyWith(
                        color: textTheme.caption.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Placeholder(
                      fallbackWidth: 20.0,
                      fallbackHeight: 20.0,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Adobo lover',
                      style: textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star_outline,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '12/12/2020',
                      style: textTheme.bodyText2.copyWith(
                        color: textTheme.caption.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Placeholder(
                      fallbackWidth: 20.0,
                      fallbackHeight: 20.0,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Adobo lover',
                      style: textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                        Icon(
                          Icons.star_outline,
                          color: Theme.of(context).accentColor,
                          size: 18.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '12/12/2020',
                      style: textTheme.bodyText2.copyWith(
                        color: textTheme.caption.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
