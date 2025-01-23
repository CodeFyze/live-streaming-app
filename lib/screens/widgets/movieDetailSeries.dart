import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/common/appUtills.dart';
import 'package:live_streaming/screens/widgets/videoPlayerWidget.dart';

class MovieDetailWidget extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {'title': 'Ahmed\nHatem', 'thumbnail': appUtills.userImage},
    {'title': 'Tara\nEmad', 'thumbnail': appUtills.userImage},
    {'title': 'Mirhan\nHussein', 'thumbnail': appUtills.userImage},
    {'title': 'Mohsen\nMansour', 'thumbnail': appUtills.userImage},
    {'title': 'Mansour\nMimi', 'thumbnail': appUtills.userImage},
    {'title': 'Saif\nEmad', 'thumbnail': appUtills.userImage},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.primary,
      appBar: AppBar(
       // backgroundColor: AppColor.primary,
      
        actions: [
          Icon(Icons.cast, color: AppColor.white),
          SizedBox(width: 16),
          Icon(
            Icons.favorite_border,
            color: AppColor.white,
          ),
          SizedBox(width: 16),
        ],
        iconTheme: IconThemeData(color: AppColor.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(color: Colors.black38),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomVideoPlayerScreen(
                                    videoUrl:
                                        "https://www.w3schools.com/html/mov_bbb.mp4")));
                      },
                      child: Center(
                        child: Icon(
                          Icons.play_circle,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(appUtills.netflixLogo),
                                      fit: BoxFit.cover),
                                  color: AppColor.primaryTransparent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'The Fourth Pyramid \n(2016)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.download,
                              color: AppColor.white,
                              size: 24,
                            ),
                            Text(
                              "Download",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _descriptionCard("Duration", "01:31:44"),
                  _descriptionCard("Director", "Peter Mimi"),
                  _descriptionCard("Genre", "Thriller"),
                  _descriptionCard("Release Date", "2016-02-03"),
                  Row(
                    children: [
                      Text(
                        'Rating:',
                        style: TextStyle(
                            color: AppColor.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 189, 139, 20),
                        size: 20,
                      ),
                      Icon(Icons.star,
                          color: Color.fromARGB(255, 189, 139, 20), size: 20),
                      Icon(Icons.star,
                          color: Color.fromARGB(255, 189, 139, 20), size: 20),
                      Icon(Icons.star_border,
                          color: Color.fromARGB(255, 189, 139, 20), size: 20),
                      Icon(Icons.star_border,
                          color: Color.fromARGB(255, 189, 139, 20), size: 20),
                    ],
                  ),
                  SizedBox(height: 6),
                  _descriptionCard("Cast:",
                      "Ahmed Hatem, Tara Emad, Mirhan Hussein, Mohsen Mansour, Mostafa Abu Seriea"),
                  SizedBox(height: 16),
                  Text(
                    'Plot',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This suspense-thriller looks into the hidden world of online hacking through several methods, such as social media, different forums, and so on. Yusuf, a brilliant engineering student, is behind a lot of the operations that are being talked about.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cast',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return _buildCard(movies[index]['title'].toString(),
                              movies[index]['thumbnail'].toString());
                        }),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Crew',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return _buildCard(movies[index]['title'].toString(),
                              movies[index]['thumbnail'].toString());
                        }),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You may also like',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return _buildCard(movies[index]['title'].toString(),
                              movies[index]['thumbnail'].toString());
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String role, String thumbnail) {
    return Container(
      width: 100,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                thumbnail,
                height: 120,
              )),
          SizedBox(height: 8),
          Text(
            role,
            style: TextStyle(color: Colors.white, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _descriptionCard(String title, details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColor.red, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            details,
            style: TextStyle(
                color: AppColor.white,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
