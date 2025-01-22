import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/ListOrder/Widget/listOrderWidget.dart';

class ListOrder extends StatefulWidget {
  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Lists Order',style: TextStyle(
          color: AppColor.white
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColor.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColor.primaryTransparent
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Movies
              ListOrderWidget(heading: "Movies", headingIcon: Icons.movie_creation,subtitle: "Movies"),
              SizedBox(height: 10,),
              //Series
              ListOrderWidget(heading: "Series", headingIcon: Icons.tv,subtitle: "Series"),
              //Live TV
              ListOrderWidget(heading: "Live TV", headingIcon: Icons.tv,subtitle: "Channels",),
             
            ],
          ),
        ),
      ),
    );
  }

  

}
