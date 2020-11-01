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
  final List<MainScreenView> _views = [
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
  List<Key> _viewKeys;
  List<AnimationController> _viewFaders;
  AnimationController _viewHider;

  @override
  void initState() {
    super.initState();

    _viewKeys = List<Key>.generate(
      _views.length,
      (index) => GlobalKey(),
    ).toList();

    _viewFaders = _views.map(
      (MainScreenView mainScreenView) => AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    )
    .toList();

    _viewFaders[_currentIndex].value = 1.0;

    _viewHider = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _viewHider.forward();
  }

  @override
  void dispose() {
    for (AnimationController controller in _viewFaders) {
      controller.dispose();
    }
    _viewHider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: TextField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'What are you craving?',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.red,
                )
              ),
              isDense: true,
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: _views.map((MainScreenView mainScreenView) {
            final Widget view = FadeTransition(
              opacity: _viewFaders[mainScreenView.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
              child: KeyedSubtree(
                key: _viewKeys[mainScreenView.index],
                child: mainScreenView.widget,
              ),
            );

            if (mainScreenView.index == _currentIndex) {
              _viewFaders[mainScreenView.index].forward();
              return view;
            } else {
              _viewFaders[mainScreenView.index].reverse();
              if (_viewFaders[mainScreenView.index].isAnimating) {
                return IgnorePointer(child: view);
              }
              return Offstage(child: view);
            }
          }).toList(),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _viewHider,
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
              items: _views.map((MainScreenView view) {
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

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _viewHider.forward();
            break;
          case ScrollDirection.reverse:
            _viewHider.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}
