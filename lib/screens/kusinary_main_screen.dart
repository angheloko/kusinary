import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class _MainScreenState extends State<KusinaryMainScreen> with TickerProviderStateMixin {
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
  List<AnimationController> _mainScreenViewFaders;
  AnimationController _mainScreenViewHider;

  @override
  void initState() {
    super.initState();

    _mainScreenViewKeys = List<Key>.generate(
      _mainScreenViews.length,
      (index) => GlobalKey(),
    ).toList();

    _mainScreenViewFaders = _mainScreenViews.map(
      (MainScreenView mainScreenView) => AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    )
    .toList();

    _mainScreenViewFaders[_currentIndex].value = 1.0;

    _mainScreenViewHider = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _mainScreenViewHider.forward();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _mainScreenViewHider.forward();
            break;
          case ScrollDirection.reverse:
            _mainScreenViewHider.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  void dispose() {
    for (AnimationController controller in _mainScreenViewFaders) {
      controller.dispose();
    }
    _mainScreenViewHider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: _mainScreenViews.map((MainScreenView mainScreenView) {
              final Widget view = FadeTransition(
                opacity: _mainScreenViewFaders[mainScreenView.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _mainScreenViewKeys[mainScreenView.index],
                  child: mainScreenView.widget,
                ),
              );

              if (mainScreenView.index == _currentIndex) {
                _mainScreenViewFaders[mainScreenView.index].forward();
                return view;
              } else {
                _mainScreenViewFaders[mainScreenView.index].reverse();
                if (_mainScreenViewFaders[mainScreenView.index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _mainScreenViewHider,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
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
                    color: Colors.grey.shade400,
                  ),
                  label: view.title,
                  activeIcon: Icon(
                    view.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
