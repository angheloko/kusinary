import 'package:flutter/material.dart';
import 'package:kusinary_app/widgets/kusinary_search_delegate.dart';

class KusinarySearchTextField extends StatefulWidget {
  @override
  _KusinarySearchTextFieldState createState() => _KusinarySearchTextFieldState();
}

class _KusinarySearchTextFieldState extends State<KusinarySearchTextField> {
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
    ThemeData themeData = Theme.of(context);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        showSearch(
          context: context,
          delegate: KusinarySearchDelegate(
            searchFieldLabel: 'What are you craving for?',
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              'What are you craving for?',
              style: themeData.textTheme.headline6.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
