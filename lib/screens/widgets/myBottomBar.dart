import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1A001F), // Dark background color
      type: BottomNavigationBarType.fixed, // Ensures all icons are evenly spaced
      selectedItemColor: Colors.white, // Selected icon color
      unselectedItemColor: Colors.white70, // Unselected icon color
      showSelectedLabels: false, // Hides labels for selected items
      showUnselectedLabels: false, // Hides labels for unselected items
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 28),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined, size: 28),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv, size: 28),
          label: 'TV',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_tv, size: 28),
          label: 'Live',
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xFF1A001F), // Dark background for the app
      body: Center(child: Text('Main Content', style: TextStyle(color: Colors.white))),
      bottomNavigationBar: MyBottomBar(),
    ),
  ));
}
