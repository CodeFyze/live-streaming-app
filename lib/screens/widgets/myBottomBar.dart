import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';

class MyBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  MyBottomBar({required this.selectedIndex, required this.onItemTapped});

   @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent, // Remove the splash effect
        highlightColor: Colors.transparent, // Remove the highlight effect
      ),
      child: BottomNavigationBar(
        backgroundColor: Color(0xFF1A001F), // Dark background color
        type: BottomNavigationBarType.fixed, // Ensures all icons are evenly spaced
        selectedItemColor: Colors.white, // Selected icon color
        unselectedItemColor: Colors.white70, // Unselected icon color
        showSelectedLabels: false, // Hides labels for selected items
        showUnselectedLabels: false, // Hides labels for unselected items
        currentIndex: selectedIndex, // Set the current index
        onTap: onItemTapped, // Handle tap events
        enableFeedback: false, // Disable feedback
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.movie_creation_outlined),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.tv),
            label: 'TV',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.live_tv),
            label: 'Live',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData) {
    return Icon(
      iconData,
      size: 28,
    );
  }
}
