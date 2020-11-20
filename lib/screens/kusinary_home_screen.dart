import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_product_slider.dart';

class KusinaryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          _buildCategories(context),
          SizedBox(height: 32.0),
          _buildNewProducts(context),
          SizedBox(height: 32.0),
          _buildNearProducts(context),
          SizedBox(height: 32.0),
          _buildPartyProducts(context),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final List<String> categories = [
      'Beverages',
      'Desserts',
      'Baked',
      'Snacks',
      'Pasta',
      'Filipino',
      'Chinese',
      'Western',
      'Asian',
      'Pork',
      'Chicken',
      'Beef',
      'Fish',
    ];

    double width = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;

    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: width * 0.27,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: 'https://images.unsplash.com/photo-1548228586-171fb0887ac0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60',
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha(0),
                          Colors.black54,
                        ],
                      ),
                    ),
                    child: Text(
                      categories[index],
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewProducts(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What\'s new',
                style: Theme.of(context).textTheme.headline6,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          KusinaryProductSlider(),
        ],
      ),
    );
  }

  Widget _buildNearProducts(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near you',
                style: Theme.of(context).textTheme.headline6,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          KusinaryProductSlider(),
        ],
      ),
    );
  }

  Widget _buildPartyProducts(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good for parties and events',
                style: Theme.of(context).textTheme.headline6,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          KusinaryProductSlider(),
        ],
      ),
    );
  }
}
