import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/message_box.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/search_bar_logic.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/skip_next_buttons.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/text_bar.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});
    static const String map1Key = 'Map1';

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  bool isSearchVisible = false;
  bool isBoxVisible = true;
  bool isTextBarVisible = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textBarController = TextEditingController();

  void _toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
    });
  }

  void _clearSearch() {
    setState(() {
      isSearchVisible = false;
      _searchController.clear();
    });
  }

  void _handleSkip() {
    print("Skip button pressed");
  }

  void _handleNext() {
    print("Next button pressed");
  }

  void _toggleTextBarVisibility() {
    setState(() {
      isTextBarVisible = !isTextBarVisible;
    });
  }

  void _handleTextBarSubmit() {
    print("Submitted text: ${_textBarController.text}");
    setState(() {
      isTextBarVisible = false;
    });
  }

  void _hideMessageBox() {
    setState(() {
      isBoxVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        GestureDetector(
  onTap: () {
    _toggleTextBarVisibility();
    _hideMessageBox();
  },
  child: ListView(
    scrollDirection: Axis.vertical, 
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal, 
        child: Column(
          children: [
            Image.asset(
              "assets/images/Mapmakeregyptstandard.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height )
          ],
        ),
      ),
    ],
  ),
),

          const ArrowBack(top: 40, left: 30),

          // Search Bar
          SearchBarLogic(
            isSearchVisible: isSearchVisible,
            onSearchPressed: _toggleSearchVisibility,
            onCloseSearch: _clearSearch,
            searchController: _searchController,
          ),

          // Message Box
          if (isBoxVisible)
            Positioned(
              top: 300,
              left: 20,
              right: 20,
              child: MessageBox(
                onClose: _hideMessageBox,
              ),
            ),

          // Skip and Next Buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: SkipNextButtons(
              onSkipPressed: _handleSkip,
              onNextPressed: _handleNext,
            ),
          ),

          // Text Bar
          if (isTextBarVisible)
            TextBar(
              controller: _textBarController,
              onSubmitted: _handleTextBarSubmit,
            ),
        ],
      ),
    );
  }
}
