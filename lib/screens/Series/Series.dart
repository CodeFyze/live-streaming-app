import 'package:flutter/material.dart';
import 'package:live_streaming/screens/widgets/moviesListWidget.dart';
import 'package:live_streaming/screens/widgets/myDrawer.dart';
import 'package:live_streaming/screens/widgets/screenHeadingBarWidget.dart';

class Series extends StatefulWidget {
  const Series({super.key});

  @override
  State<Series> createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  final List<Map<String, String>> movies = [
    {'title': 'The Fourth Pyramid', 'year': '2016'},
    {'title': 'Spiral: From the Book of Saw', 'year': '2021'},
    {'title': 'Saw 3D', 'year': '2010'},
    {'title': 'A Natural Born Fool', 'year': '2004'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),

            // New Movies Section
            ScreenHeadingBarWidget(
              title: "All", 
              subtitle: "More",
               moviesCount: "268"),
            SizedBox(height: 10),

            // Horizontal List of Movies
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MoviesListWidget(movies: movies, index: index);
                  }),
            ),

            SizedBox(height: 40),

            // New Movies Section
            ScreenHeadingBarWidget(
              title: "Recently Added", 
              subtitle: "More",
               moviesCount: "50"),
           
            SizedBox(height: 10),
            // Horizontal List of Movies
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MoviesListWidget(movies: movies, index: index);
                },
              ),
            ),

 SizedBox(height: 40),
             // New Movies Section
            ScreenHeadingBarWidget(
              title: "Series", 
              subtitle: "More",
               moviesCount: "250"),
           
            SizedBox(height: 10),
            // Horizontal List of Movies
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MoviesListWidget(movies: movies, index: index);
                },
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}