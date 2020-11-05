import 'package:flutter/material.dart';

class KusinarySearchDelegate extends SearchDelegate {

  KusinarySearchDelegate({
    String searchFieldLabel,
  }):
    super(
      searchFieldLabel: searchFieldLabel
    );


  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      close(context, null);
    });
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

class KusinarySearch extends StatefulWidget {
  @override
  _KusinarySearchState createState() => _KusinarySearchState();
}

class _KusinarySearchState extends State<KusinarySearch> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextField(
        focusNode: _focusNode,
        onTap: () {
          _focusNode.unfocus();
          showSearch(context: context, delegate: KusinarySearchDelegate(
            searchFieldLabel: 'What are you craving for?',
          ));
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          hintText: 'What are you craving for?',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          isDense: true,
        ),
      ),
    );
  }
}
