import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/common/appUtills.dart';

class MoviesListWidget extends StatefulWidget {
  List<Map<String, String>> movies;
  int index;

   MoviesListWidget({required this.movies, required this.index, super.key});

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Movie Card
                        Container(
                          width: 120,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColor.primaryTransparent, // Dark purple for cards
                            image: DecorationImage(
                              image: AssetImage(
                                appUtills.netflixLogo),
                                fit: BoxFit.cover),
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
                                '${widget.movies[widget.index]['title']} (${widget.movies[widget.index]['year']})',
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
  }
}