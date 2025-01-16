import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';

class WatchHistory extends StatelessWidget {
  final List<Map<String, String>> History = [
    {'title': 'The Fourth Pyramid'},
    {'title': 'Spiral: From the Book of Saw'},
    {'title': 'Saw 3D'},
    {'title': 'The Matrix'},
  ];

  final List<Map<String, String>> LiveTV = [
    {'title': 'Fifty Shades of Grey'},
    {'title': 'John Wick'},
    {'title': 'The Dark Knight'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryTransparent,
        elevation: 0,
        title: Text(
          'Watch History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cast, color: Colors.white),
            onPressed: () {
              // Handle cast button
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movies Section
              _buildSectionHeader('Movies'),
              Divider(thickness: 1, color: AppColor.lightGrey),
              SizedBox(
                height: 140, // Constrain the height of the ListView.builder
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: History.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _buildItemWithDelete(
                                      title: "${History[index]['title']}",
                                    ),
                    );
                  },
                ),
              ),
              
              SizedBox(height: 16),

              // Series Section
              _buildSectionHeader('Series'),
              Divider(thickness: 1, color: AppColor.lightGrey),
              SizedBox(height: 8),

              // Live TV Section
              _buildSectionHeader('Live TV'),
              Divider(thickness: 1, color: AppColor.lightGrey),
              SizedBox(height: 8),
              SizedBox(
                height: 140, // Constrain the height of the ListView.builder
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: LiveTV.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _buildItemWithDelete(
                                      title: "${LiveTV[index]['title']}",
                                    ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.delete, color: Colors.red),
      ],
    );
  }

  Widget _buildItemWithDelete({required String title, bool isEmpty = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        width: 90,
        height: 140,
        decoration: BoxDecoration(
          color: AppColor.primaryTransparent,
          borderRadius: BorderRadius.circular(2)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 8),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4,)
          ],
        ),
      ),
    );
  }
}
