import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/widgets/movieDetailSeries.dart';

class ListLiveTv extends StatelessWidget {
  final List<Map<String, String>> liveTvChannels = [
    {'index': '27', 'title': 'MR-ROBOT'},
    {'index': '26', 'title': 'Indel'},
    {'index': '25', 'title': 'fauda'},
    {'index': '24', 'title': 'FoodTV'},
    {'index': '23', 'title': 'Goar-back'},
    {'index': '22', 'title': 'Salhy'},
    {'index': '21', 'title': 'Nasar'},
    {'index': '20', 'title': 'Alarabia Alhadath'},
    {'index': '19', 'title': 'sport 4'},
    {'index': '18', 'title': 'Reshet 12'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary, // Dark background color
      appBar: AppBar(
        title: Text('All',style: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
          ),),
          iconTheme: IconThemeData(
            color: AppColor.white
          ),
          centerTitle: true,
        backgroundColor: AppColor.primaryTransparent,
        elevation: 0,
        actions: [
          Icon(Icons.cast,size: 25,),
          SizedBox(width: 5,),
          
          Icon(Icons.search,size: 25),

        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: liveTvChannels.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailWidget()));  
              
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Placeholder for image
                  Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColor.primaryTransparent,
                     // borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Channel Index and Title
                  Expanded(
                    child: Text(
                      '${liveTvChannels[index]['index']} - ${liveTvChannels[index]['title']}',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ListLiveTv(),
  ));
}
