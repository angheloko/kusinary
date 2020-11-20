import 'package:flutter/material.dart';

class KusinarySearchDelegate extends SearchDelegate {

  KusinarySearchDelegate({
    String searchFieldLabel,
  }) : super(searchFieldLabel: searchFieldLabel);

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('No results found'),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Suggestion 1'),
        ),
      ],
    );
  }
}