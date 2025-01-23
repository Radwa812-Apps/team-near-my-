import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Home/components/icon_button_widegt.dart';
import 'package:nearme_app/Features/Home/components/make_group_widget.dart';
import 'package:nearme_app/core/constants.dart'; // Adjust the import as needed
import 'package:nearme_app/Features/Home/components/home_bar_widget.dart';
import '../components/bottom_container_with_icons.dart'; // Import HomeAppBar

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      print('Performing search for: $query');
      // Add your search logic here
    } else {
      print('Search query is empty');
    }
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: HomeAppBar(
        isSearching: _isSearching,
        onSearchPressed: _toggleSearch,
        onClosePressed: _toggleSearch,
        searchController: _searchController,
        onSearch: _performSearch,
        onSearchChanged: (value) {
          print('Search query: $value');
        },
      ),
      body: Stack(
        children: [
          // Main content of the page
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Hi'),
                    );
                  },
                  // add this until we build the back
                ),
              ),
              BottomContainerWithIcons(),
            ],
          ),

          // Floating yellow button (does not affect the layout)
          Positioned(
            bottom: 100, // Adjust the position as needed
            right: 20, // Adjust the position as needed
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: kSpecialColor, // Yellow color
                borderRadius: BorderRadius.circular(30), // Circular shape
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  print('Add button pressed');
                },
              ),
            ),
          ),
          MakeGroupWidget(),
        ],
      ),
    );
  }
}
