import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/Home/home.dart';
import 'package:live_streaming/screens/LiveTv/liveTv.dart';
import 'package:live_streaming/screens/Movies/Movies.dart';
import 'package:live_streaming/screens/Series/Series.dart';
import 'package:live_streaming/screens/widgets/myBottomBar.dart';
import 'package:live_streaming/screens/widgets/myDrawer.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int selectedItem = 0;

  final List<Widget> _pages = [
    Home(),
    Movies(),
    Series(),
    LiveTv()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: AppColor.primary,
      body: _pages[selectedItem], // Display the selected page
      bottomNavigationBar: MyBottomBar(
        selectedIndex: selectedItem,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
