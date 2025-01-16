import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/Downloads/Widget/downloadWidget.dart';

class Download extends StatelessWidget {
  String title;
   Download({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: AppColor.primaryTransparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),

         Text(
              title,
              style: TextStyle(fontSize: 18,
               fontWeight: FontWeight.bold,
               color: AppColor.white
               ),
            ),
          ],
        ),
        
        actions: [
          IconButton(
            icon: Icon(Icons.cast, color: Colors.white),
            onPressed: () {
              // Handle cast button press
            },
          ),
        ],
      ),
      body: DownloadWidget()
    );
  }
}