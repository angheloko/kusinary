import 'package:flutter/material.dart';
import 'package:kusinary_app/screens/kusinary_account_screen.dart';
import 'package:kusinary_app/screens/kusinary_favorites_screen.dart';
import 'package:kusinary_app/screens/kusinary_home_screen.dart';
import 'package:kusinary_app/screens/kusinary_kitchen_screen.dart';

class MainScreenView {
  final int index;
  final String title;
  final IconData icon;
  final Widget widget;

  MainScreenView({
    this.index,
    this.title,
    this.icon,
    this.widget,
  });
}

class KusinaryMainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<KusinaryMainScreen> {
  final List<MainScreenView> _mainScreenViews = [
    MainScreenView(
      index: 0,
      title: '',
      icon: Icons.home,
      widget: KusinaryHomeScreen(),
    ),
    MainScreenView(
      index: 1,
      title: '',
      icon: Icons.favorite,
      widget: KusinaryFavoritesScreen(),
    ),
    MainScreenView(
      index: 2,
      title: '',
      icon: Icons.storefront,
      widget: KusinaryKitchenScreen(),
    ),
    MainScreenView(
      index: 3,
      title: '',
      icon: Icons.account_circle,
      widget: KusinaryAccountScreen(),
    ),
  ];

  int _currentIndex = 0;
  List<Key> _mainScreenViewKeys;


  @override
  void initState() {
    super.initState();

    _mainScreenViewKeys = List<Key>.generate(
      _mainScreenViews.length,
      (index) => GlobalKey(),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: _mainScreenViews.map((MainScreenView mainScreenView) {
            final Widget view = KeyedSubtree(
              key: _mainScreenViewKeys[mainScreenView.index],
              child: mainScreenView.widget,
            );

            if (_currentIndex == mainScreenView.index) {
              return view;
            } else {
              return Offstage(child: view);
            }
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _mainScreenViews.map((MainScreenView view) {
          return BottomNavigationBarItem(
            icon: Icon(
              view.icon,
              color: Colors.greenAccent,
            ),
            label: view.title,
            activeIcon: Icon(
              view.icon,
              color: Colors.green,
            ),
          );
        }).toList(),
      ),
    );
  }
}
