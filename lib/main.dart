import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_catalog_screen.dart';
import 'package:kusinary_app/screens/kusinary_main_screen.dart';
import 'package:kusinary_app/screens/kusinary_product_details_screen.dart';

void main() {
  runApp(KusinaryApp());
}

class KusinaryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return MaterialApp(
      title: 'Kusinary',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: themeData.primaryIconTheme.copyWith(
          color: Colors.grey[700],
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1.0,
          textTheme: themeData.textTheme.copyWith(
            headline6: themeData.textTheme.headline6.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          headline6: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      home: KusinaryMainScreen(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case KusinaryProductDetailsScreen.routeName:
                return KusinaryProductDetailsScreen();
              case KusinaryCatalogScreen.routeName:
                return KusinaryCatalogScreen();
            }
            return KusinaryMainScreen();
          },
        );
      },
    );
  }
}
