import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/main.dart'; // Import the main.dart for the ValueNotifier

class AppThemeScreen extends StatefulWidget {
  @override
  _AppThemeScreenState createState() => _AppThemeScreenState();
}

class _AppThemeScreenState extends State<AppThemeScreen> {
  int _selectedThemeIndex = 4; // Preselected Theme 5 (index 4)

  final List<Color> themeColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    AppColor.primary,
    Colors.pink,
    Colors.teal,
  ];
  final List<Color>appBarThemeColors=[
    const Color.fromARGB(105, 33, 149, 243),
    const Color.fromARGB(146, 76, 175, 79),
    const Color.fromARGB(147, 255, 153, 0),
    const Color.fromARGB(132, 155, 39, 176),
    const Color.fromARGB(159, 14, 0, 15),
    const Color.fromARGB(145, 233, 30, 98),
    const Color.fromARGB(162, 0, 150, 135),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryTransparent,
        title: const Text(
          "App Theme",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -170,
            left: -115,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColor.red, AppColor.lightRed]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 160),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColor.blackBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: themeColors.length,
                      itemBuilder: (context, index) {
                        return ThemeOptionTile(
                          themeName: "Theme ${index + 1}",
                          isSelected: _selectedThemeIndex == index,
                          onTap: () {
                            setState(() {
    _selectedThemeIndex = index;
    appThemeColor.value = themeColors[index]; // Update body background color
    appBarThemeColor.value = appBarThemeColors[index]; // Update AppBar color
  });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -205,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColor.red, AppColor.lightRed]),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeOptionTile extends StatelessWidget {
  final String themeName;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeOptionTile({
    required this.themeName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.red : Colors.white,
              size: 22,
            ),
            const SizedBox(width: 16),
            Text(
              themeName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
