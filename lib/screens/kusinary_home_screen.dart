import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

class KusinaryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, KusinaryProductDetailsScreen.routeName);
            },
            child: Center(
              child: Text('tap here'),
            ),
          ),
        ),
      ),
    );
  }
}
