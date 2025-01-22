import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/LiveTv/ListLiveTv.dart';
import 'package:live_streaming/screens/widgets/moviesListWidget.dart';
import 'package:live_streaming/screens/widgets/myDrawer.dart';
import 'package:live_streaming/screens/widgets/screenHeadingBarWidget.dart';

class LiveTv extends StatefulWidget {
  bool isMultiScreen=false;
  Function(String)? onMovieSelected;
   LiveTv({super.key, this.isMultiScreen=false,this.onMovieSelected});

  @override
  State<LiveTv> createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {
   final List<Map<String, dynamic>> categories = [
    {"title": "All", "count": 27},
    {"title": "Continue Watching", "count": 1},
    {"title": "Recently Added", "count": 50},
    {"title": "Favorite", "count": 0},
    {"title": "Streams", "count": 27},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryTransparent,
        iconTheme: IconThemeData(
          color: AppColor.white
        ),
      ),
     drawer: MyDrawer(),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.all(6.0),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()async{
                  // String? selectedMovie;
                  widget.isMultiScreen?  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListLiveTv(
                  isMultiScreen: widget.isMultiScreen,
                  onMovieSelected: (movie) {
                    widget.onMovieSelected!(movie); // Call the callback
                    
                  },
                ),
              ),
            ): Navigator.push(context, MaterialPageRoute(builder: (context)=>ListLiveTv()));
                },
                child: Card(
                  color: AppColor.primaryTransparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.folder,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      categories[index]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '${categories[index]['count']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
                  ),
          ),
        ],
      )
      );
  }
}