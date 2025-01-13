import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/Home/home.dart';

class MyPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary, // Dark purple background
      body: Stack(
        children: [
          // Background design
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
            'My Playlists',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColor.white),
                    ),
          ),
          Positioned(
            top: -140,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Add Playlist button
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: [
                Icon(Icons.add_circle_outlined,size: 25,color: AppColor.white,),
                Container(
                  child: Text("Add PlayList",style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),),
                ),
              ],
            )
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 80),
                // Playlist card
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryTransparent, // Slightly lighter purple for the card
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.people, size: 40, color: Colors.brown),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:  MrxTvPublic',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Username  mrx@1994',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white)),
                    ],
                  ),
                ),
                Spacer(),
                // Bottom button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.check, color: Colors.white),
                    label: Text(
                      'Playlist Added',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}