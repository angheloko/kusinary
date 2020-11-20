import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_search_delegate.dart';

class KusinarySearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: KusinarySearchDelegate(
            searchFieldLabel: 'What are you craving for?',
          ),
        );
      },
    );
  }
}
