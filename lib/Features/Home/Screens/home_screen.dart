import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Home/components/container_textfield_floating_icon.dart';
import 'package:nearme_app/Features/Home/components/group_style.dart';
import 'package:nearme_app/Features/Home/components/home_bar_widget.dart';
import 'package:nearme_app/Features/Home/components/row_after_bar_chats_groups.dart';
import 'package:nearme_app/core/constants.dart';
import '../components/bottom_container_with_icons.dart';
import '../components/floating_yellow_icon.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  bool _isDraggableSheetVisible = false;
  final TextEditingController _searchController = TextEditingController();
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  String _selectedTab =
      'Groups'; // Track whether "Chats" or "Groups" is selected
  List<String> _groups = []; // List to store dynamically added groups

  // Toggle search bar visibility
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  // Perform search operation
  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      print('Performing search for: $query');
    } else {
      print('Search query is empty');
    }
  }

  // Toggle visibility of draggable sheet
  void _toggleDraggableSheet() {
    setState(() {
      _isDraggableSheetVisible = !_isDraggableSheetVisible;
    });
  }

  // Expand the draggable sheet when the text field is focused
  void _expandDraggableSheet() {
    _draggableScrollableController.animateTo(0.6,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  // Switch between "Chats" and "Groups" tabs
  void _selectTab(String tabName) {
    setState(() {
      _selectedTab = tabName;
      _isDraggableSheetVisible = false; // Hide the sheet when switching tabs
    });
  }

  // Add a new group to the list
  void _addGroup(String groupName) {
    if (groupName.isNotEmpty) {
      setState(() {
        _groups.add(groupName);
        _isDraggableSheetVisible = false; // Close the sheet after adding
      });
    }
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
          Column(
            children: [
              // Row below the app bar for "Chats" or "Groups"
              RowAfterBarChatsGroups(
                selectedTab: _selectedTab,
                onTabSelected: _selectTab,
              ),
              SizedBox(
                height: 20,
              ),

              // Main content: Show groups or chats
              Expanded(
                child: _selectedTab == 'Groups'
                    ? (_groups.isEmpty
                        ? Center(
                            child: Text(
                              'No groups added. Tap the icon below to create one.',
                              style: const TextStyle(
                                  color: kFontColor,
                                  fontSize: 16,
                                  fontFamily: kFontItalic),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _groups.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: GroupStyle(
                                  groupName:
                                      _groups[index], // Pass group name here
                                ),
                              );
                            },
                          ))
                    : Center(
                        child: Text(
                          'No chats available.',
                          style: const TextStyle(
                              color: kFontColor,
                              fontSize: 16,
                              fontFamily: kFontItalic),
                        ),
                      ),
              ),

              // Bottom container with icons
              BottomContainerWithIcons(),
            ],
          ),

          // Show draggable sheet and floating icon only for "Groups" tab
          if (_selectedTab == 'Groups') ...[
            // Draggable sheet for adding a group
            if (_isDraggableSheetVisible)
              GestureDetector(
                onTap: _toggleDraggableSheet,
                child: ContainerTextFieldWidget(
                  onTextFieldFocus: _expandDraggableSheet,
                  draggableScrollableController: _draggableScrollableController,
                  onSubmitted: (groupName) {
                    _addGroup(groupName); // Add the group when submitted
                  },
                ),
              ),

            // Floating yellow icon for opening the draggable sheet
            if (!_isDraggableSheetVisible)
              FloatingYellowIcon(toggleDraggableSheet: _toggleDraggableSheet),
          ],
        ],
      ),
    );
  }
}
