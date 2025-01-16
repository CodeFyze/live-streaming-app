import 'package:flutter/material.dart';

class DownloadWidget extends StatefulWidget {
  const DownloadWidget({super.key});

  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Download Icon with Badge
            Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.download, // Main download icon
                  size: 80,
                  color: Colors.white,
                ),
                // Badge Icon
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A001F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // No Downloads Text
            Text(
              'No Downloads Found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Subtext
            Text(
              'Movies or Episodes that you download using\nDownloader 1 will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
  }
}