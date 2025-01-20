import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/common/appUtills.dart';
import 'package:live_streaming/screens/widgets/moviesListWidget.dart';
import 'package:live_streaming/screens/widgets/myBottomBar.dart';
import 'package:live_streaming/screens/widgets/myDrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  final List<Map<String, String>> movies = [
    {'title': 'The Fourth Pyramid', 'year': '2016'},
    {'title': 'Spiral: From the Book of Saw', 'year': '2021'},
    {'title': 'Saw 3D', 'year': '2010'},
    {'title': 'A Natural Born Fool', 'year': '2004'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        title: Text("My Home",style: TextStyle(
          color: AppColor.white
        ),),
      ),
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            // Centered Movie Title
            Center(
              child: Text(
                'A Natural Born Fool (2004)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 20),
        
            // New Movies Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'New Movies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
        
            // Horizontal List of Movies
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MoviesListWidget(
                    movies: movies,
                   index: index);
                  }
              ),
            ),
            SizedBox(height: 40),
        
             // New Movies Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Latest Updated Series',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
         // Horizontal List of Movies
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return  MoviesListWidget(
                    movies: movies,
                   index: index);
                },
              ),
            ),
           SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}