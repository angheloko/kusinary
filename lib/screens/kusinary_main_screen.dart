import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kusinary_app/screens/kusinary_account_screen.dart';
import 'package:kusinary_app/screens/kusinary_favorites_screen.dart';
import 'package:kusinary_app/screens/kusinary_home_screen.dart';
import 'package:kusinary_app/screens/kusinary_messages_screen.dart';
import 'package:kusinary_app/widgets/kusinary_search_text_field.dart';

class MainScreenView {
  final int index;
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Widget Function() builder;

  MainScreenView({
    this.index,
    this.title,
    this.icon,
    this.activeIcon,
    this.builder,
  });
}

class KusinaryMainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<KusinaryMainScreen> with TickerProviderStateMixin {
  List<MainScreenView> _views = [];
  int _currentIndex = 0;
  List<Key> _viewKeys;

  @override
  void initState() {
    super.initState();

    _views = [
      MainScreenView(
        index: 0,
        title: 'Explore',
        icon: Icons.store_outlined,
        activeIcon: Icons.store,
        builder: () => KusinaryHomeScreen(),
      ),
      MainScreenView(
        index: 1,
        title: 'Favorites',
        icon: Icons.favorite_outline,
        activeIcon: Icons.favorite,
        builder: () => KusinaryFavoritesScreen(),
      ),
      MainScreenView(
        index: 2,
        title: 'Messages',
        icon: Icons.chat_bubble_outline,
        activeIcon: Icons.chat_bubble,
        builder: () => KusinaryMessagesScreen(),
      ),
      MainScreenView(
        index: 3,
        title: 'Account',
        icon: Icons.account_circle_outlined,
        activeIcon: Icons.account_circle,
        builder: () => KusinaryAccountScreen(),
      ),
    ];

    _viewKeys = List<Key>.generate(
      _views.length,
      (index) => GlobalKey(),
    ).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KusinarySearchTextField(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: _views.map<Widget>((MainScreenView view) {
            return KeyedSubtree(
              key: _viewKeys[view.index],
              child: view.builder(),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _views.map((MainScreenView view) {
          return BottomNavigationBarItem(
            icon: Icon(
              view.icon,
            ),
            activeIcon: Icon(
              view.activeIcon,
            ),
            label: view.title,
          );
        }).toList(),
      ),
    );
  }
}
