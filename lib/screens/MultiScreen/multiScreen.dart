import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/LiveTv/liveTv.dart';
import 'package:live_streaming/screens/MultiScreen/Widget/layoutOptionWidgets.dart';
import 'package:live_streaming/screens/widgets/videoPlayerWidget.dart';


class MultiScreen extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
            LayoutOption(onTap: (){
              _navigateToLayout(context, 4);
            }),
            SizedBox(width: 40,),
            ThreeScreen(onTap: (){}),
            SizedBox(width: 40,),
            TwoScreen(onTap: (){}),
          ],),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TwoVerticalScreen(onTap: (){}),
            SizedBox(width: 40,),
            FourVerticalScreen(onTap: (){}),
            SizedBox(width: 40,),
            SizedBox(width: 166,)
          ],),
        ],
      ),
    );
  }



  void _navigateToLayout(BuildContext context, int layoutType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FourMovieScreen(),
      ),
    );
  }
}


class FourMovieScreen extends StatefulWidget {

  const FourMovieScreen({super.key});

  @override
  State<FourMovieScreen> createState() => _FourMovieScreenState();
}

class _FourMovieScreenState extends State<FourMovieScreen> {
  bool isTrue=false;
 List<String?> selectedMovies = ['', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
                child: Container(
                  height: 130,
                
                child: GestureDetector(
                  onTap: ()async{
                     String? selectedMovie = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveTv(
                            isMultiScreen: true,
                            onMovieSelected:(movie){
                              setState(() {
                                selectedMovies[0] = movie;
                              });
                             // Navigator.pop(context);
                            }
                            ),
                        ),
                      );
                      if (selectedMovie![0] != null) {
                        setState(() {
                          selectedMovies[0] = selectedMovie;
                        });}
                  },
                  child:selectedMovies[0]!=''? CustomVideoPlayerScreen(videoUrl: selectedMovies[0]??''):Icon(Icons.add_circle,color: Colors.white, size: 35,)
                  ),
                
                ),
              ),
                     SizedBox(width: 16,),
                     Expanded(
                child: Container(
                   height: 130,
                
                
                child: GestureDetector(
                  onTap: ()async{
                     String? selectedMovie = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveTv(
                            isMultiScreen: true,
                            onMovieSelected:(movie){
                              setState(() {
                                selectedMovies[1] = movie;
                              });
                             // Navigator.pop(context);
                            }
                            ),
                        ),
                      );
                      if (selectedMovie != null) {
                        setState(() {
                          selectedMovies[1] = selectedMovie;
                        });}
                  },
                  child:selectedMovies[1]!=''? CustomVideoPlayerScreen(videoUrl: selectedMovies[1]??''):Icon(Icons.add_circle,color: Colors.white, size: 35,)
                  ),
                
                ),
              ),
            
            ],),
          SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Expanded(
                child: Container(
                   height: 130,
                
                child: GestureDetector(
                  onTap: ()async{
                     String? selectedMovie = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveTv(
                            isMultiScreen: true,
                            onMovieSelected:(movie){
                              setState(() {
                                selectedMovies[2] = movie;
                              });
                             // Navigator.pop(context);
                            }
                            ),
                        ),
                      );
                      if (selectedMovie != null) {
                        setState(() {
                          selectedMovies[2] = selectedMovie;
                        });}
                  },
                  child:selectedMovies[2]!=''? CustomVideoPlayerScreen(videoUrl: selectedMovies[2]??''):Icon(Icons.add_circle,color: Colors.white, size: 35,)
                  ),
                
                ),
              ),
           SizedBox(width: 16,),
            Expanded(
                child: Container(
                   height: 130,
               
                child: GestureDetector(
                  onTap: ()async{
                     String? selectedMovie = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveTv(
                            isMultiScreen: true,
                            onMovieSelected:(movie){
                              setState(() {
                                selectedMovies[3] = movie;
                              });
                             // Navigator.pop(context);
                            }
                            ),
                        ),
                      );
                      if (selectedMovie != null) {
                        setState(() {
                          selectedMovies[3] = selectedMovie;
                        });}
                  },
                  child:selectedMovies[3]!=''? CustomVideoPlayerScreen(videoUrl: selectedMovies[3]??''):Icon(Icons.add_circle,color: Colors.white, size: 35,)
                  ),
                
                ),
              ),
            
            ],),
            SizedBox(height: 10,),
            Text("Require multiple connections and enough Device RAM", style: TextStyle(
              fontSize: 16, color: AppColor.orange
            ),)
         
          ],),
      ),
      backgroundColor: Colors.black,
    );
  }
}
