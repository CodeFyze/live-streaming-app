import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/common/appUtills.dart';
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
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150),
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
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Card
                      Container(
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppColor.primaryTransparent, // Dark purple for cards
                          borderRadius: BorderRadius.circular(10),
                        ),
                      
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 8),
                          
                          // Movie Title
                          SizedBox(
                            width: 100,
                            child: Text(
                              '${movies[index]['title']} (${movies[index]['year']})',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          
                        ],
                      ),
                      ),
                    ],
                  ),
                );
              },
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
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Card

                      Image.asset(appUtills.netflixLogo),
                    //   ClipRRect(
                    // borderRadius: BorderRadius.circular(10), // Rounded corners
                    // child: Stack(
                    //   children: [
                    //     // Placeholder while the image is loading
                    //     Container(
                    //       color: Colors.deepPurple.withOpacity(0.6), // Loading placeholder color
                    //     ),

                    //     // The actual image
                    //     FadeInImage.assetNetwork(
                    //       placeholder: '', // Add a placeholder image path (optional)
                    //       image: appUtills.netflixLogo,
                    //       fit: BoxFit.cover,
                    //       width: 120,
                    //       height: 150,
                    //       fadeInDuration: Duration(milliseconds: 300),
                    //     ),

                    //     // Title overlay at the bottom
                    //     Align(
                    //       alignment: Alignment.bottomCenter,
                    //       child: Container(
                    //         width: double.infinity,
                    //         padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    //         color: Colors.black54, // Semi-transparent overlay
                    //         child: Text(
                    //           '${movies[index]['title']} (${movies[index]['year']})',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //           maxLines: 2,
                    //           overflow: TextOverflow.ellipsis,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //   ),
                   
                    ],
                  ),
                );
              },
            ),
          ),
         
          
        ],
      ),
    );
  }
}