import 'package:flutter/material.dart';

class SearchHomeDelegate extends SearchDelegate {
  final Color backgroundColor;
  final double shadowElevation;
  final Color hintTextColor;
  final Color searchBoxShadowColor;

  // Constructor to allow customization
  SearchHomeDelegate({
    this.backgroundColor = Colors.green,
    this.shadowElevation = 4.0,
    this.hintTextColor = Colors.grey,
    this.searchBoxShadowColor = Colors.black26,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context,
            null); // Close the search and return to the previous screen
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('You selected: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Suggestions for: $query'),
    );
  }

  @override
  Widget buildSuggestionsOverlay(BuildContext context) {
    return Material(
      elevation: shadowElevation, // Shadow elevation for the container
      color: Colors.transparent, // Transparent to show only your container
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Background color of the container
          boxShadow: [
            BoxShadow(
              color: searchBoxShadowColor, // Shadow color
              blurRadius: 10.0, // Shadow blur radius
              spreadRadius: 2.0, // Shadow spread radius
            ),
          ],
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        margin: EdgeInsets.all(16.0), // Add margin for padding around container
        padding: EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search here...',
            hintStyle: TextStyle(color: hintTextColor), // Hint text color
            border: InputBorder.none,
          ),
          onChanged: (value) {
            query = value;
          },
        ),
      ),
    );
  }
}
