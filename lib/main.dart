import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_main_screen.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

void main() {
  runApp(KusinaryApp());
}

class KusinaryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kusinary',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KusinaryMainScreen(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case KusinaryProductDetailsScreen.routeName:
                return KusinaryProductDetailsScreen();
            }
            return KusinaryMainScreen();
          },
        );
      },
    );
  }
}
