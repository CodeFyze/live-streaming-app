import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/LiveTv/liveTv.dart';
import 'package:live_streaming/screens/MultiScreen/Widget/layoutOptionWidgets.dart';
import 'package:live_streaming/screens/widgets/videoPlayerWidget.dart';
import 'package:video_player/video_player.dart';


class MultiScreen extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    // Lock orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return WillPopScope(
      onWillPop: () async {
        // Reset orientation when leaving this screen
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true; // Allow navigation back
      },
      child : Scaffold(
      body: Flexible(
        child: Column(
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
      ),
    ));
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
 List<VideoPlayerScreen?> videoPlayers = [null, null, null, null];

 @override
void dispose() {
  // No need to dispose CustomVideoPlayerScreen instances manually
  super.dispose();
}

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
                      onTap: () async {
                        await _selectMovie(0, context);
                      },
                      child: videoPlayers[0] ??
                          Icon(Icons.add_circle, color: Colors.white, size: 35),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 130,
                    child: GestureDetector(
                      onTap: () async {
                        await _selectMovie(1, context);
                      },
                      child: videoPlayers[1] ??
                          Icon(Icons.add_circle, color: Colors.white, size: 35),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 130,
                    child: GestureDetector(
                      onTap: () async {
                        await _selectMovie(2, context);
                      },
                      child: videoPlayers[2] ??
                          Icon(Icons.add_circle, color: Colors.white, size: 35),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 130,
                    child: GestureDetector(
                      onTap: () async {
                        await _selectMovie(3, context);
                      },
                      child: videoPlayers[3] ??
                          Icon(Icons.add_circle, color: Colors.white, size: 35),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Require multiple connections and enough Device RAM",
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Future<void> _selectMovie(int index, BuildContext context) async {
    String? selectedMovie = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LiveTv(
          isMultiScreen: true,
          onMovieSelected: (movie) {
            setState(() {
              selectedMovies[index] = movie;
              videoPlayers[index] = VideoPlayerScreen(videoUrl: movie);
            });
          },
        ),
      ),
    );
    if (selectedMovie != null) {
      setState(() {
        selectedMovies[index] = selectedMovie;
        videoPlayers[index] = VideoPlayerScreen(videoUrl: selectedMovie);
      });
    }
  }
}


class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Refresh the widget once the video is initialized
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }
}
