import 'dart:developer';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:intl/intl.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/controller/provider/AppState.dart';
import 'package:live_streaming/screens/mainScreen.dart';
import 'package:live_streaming/screens/widgets/globalVideoPlayer.dart';
import 'package:live_streaming/screens/widgets/homeWidget.dart';
import 'package:pip_view/pip_view.dart';
import 'package:provider/provider.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  String videoUrl;
   CustomVideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _CustomVideoPlayerScreenState createState() => _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _showControls = true;
  bool _isMinimized = false;
  final Battery _battery = Battery();
  int _batteryLevel = 0;
  double _brightness = 0.5;
  double _volume = 0.7;
  double _playbackSpeed = 1.0;
   Offset _pipOffset = Offset(10, 100);
  final GlobalVideoPlayerManager _playerManager = GlobalVideoPlayerManager();

  @override
  void initState() {
    super.initState();
    PIPView.of(context)?.deactivate();
    _initializePlayer();
    _setLandscapeOrientation();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _fetchBatteryLevel();
    _initializeBrightness();
    _initializeVolume();
    //_playerManager.initialize(widget.videoUrl);
  }

  Future<void> _fetchBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
    });
  }

  Future<void> _initializeVolume() async {
    try {
      _volume = await FlutterVolumeController.getVolume() ?? 0.0;
      setState(() {});
    } catch (e) {
      print("Error getting volume: $e");
    }
  }

  Future<void> _initializeBrightness() async {
    try {
      _brightness = await ScreenBrightness().current;
      setState(() {});
    } catch (e) {
      print("Error getting brightness: $e");
    }
  }

  Future<void> _setBrightness(double value) async {
    await ScreenBrightness().setScreenBrightness(value);
    setState(() {
      _brightness = value;
    });
  }

  Future<void> _setVolume(double value) async {
    await FlutterVolumeController.setVolume(value);
    setState(() {
      _volume = value;
    });
  }

  Future<void> _setPlaybackSpeed(double speed) async {
  if (_controller!.value.isInitialized) {
    try {
      await _controller!.setPlaybackSpeed(speed);
      setState(() {
        _playbackSpeed = speed;
      });
    } catch (e) {
      print("Error setting playback speed: $e");
    }
  }
}

  @override
  void dispose() {
    _resetOrientation();
    _controller!.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  void _initializePlayer() {
    
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _resetOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }

   void _toggleMinimize() {
    setState(() {
      _isMinimized = !_isMinimized;
    });
    if (_isMinimized) {
      // Show the PIP view
      PIPView.of(context)?.presentBelow(mainScreen());
    } else {
      // Close the PIP view
      PIPView.of(context)?.deactivate();
    }
  }

  Widget _buildControls() {
    return Stack(
      children: [
        Positioned(
          left: 8,
          top: 0,
          //bottom: -10,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Positioned(
          top: 8,
          left: MediaQuery.of(context).size.width / 6 - 60,
          child: Text(
            'The Fourth Pyramid (2016)',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    'Battery: $_batteryLevel%',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(_batteryLevel >= 80
      ? Icons.battery_full
      : _batteryLevel >= 50
          ? Icons.battery_4_bar_sharp
          : _batteryLevel >= 20
              ? Icons.battery_3_bar_sharp
              : Icons.battery_1_bar, color:_batteryLevel<=20?AppColor.red :Colors.white),
                ],
              ),
              SizedBox(width: 8),
              Text(
                DateFormat('EEEE DD-MMM-yy').format(DateTime.now()).toString(),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.text_fields, color: Colors.white),
              SizedBox(width: 8),
              Icon(Icons.closed_caption, color: Colors.white),
            ],
          ),
        ),
        Center(
          child: IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
              color: Colors.white,
              size: 60,
            ),
            onPressed: _togglePlayPause,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Column(
            children: [
              VideoProgressIndicator(
                _controller!,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.red,
                  backgroundColor: Colors.grey,
                  
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_formatDuration(_controller!.value.position)} / ${_formatDuration(_controller!.value.duration)}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
  border: Border.all(color: AppColor.lightGrey,width: 1),
  borderRadius: BorderRadius.circular(40)
),
                        child: Icon(Icons.lock_outline, color: Colors.white),
                      ),
                      SizedBox(width: 10,),
                     GestureDetector(
                      onTap: _showControlPopup,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white,width: 1),
                          borderRadius: BorderRadius.circular(40)
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.settings, color: Colors.white),
                              Text(
                                  'Control',
                                  style: TextStyle(color: Colors.white),
                                ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.fullscreen, color: Colors.white,size: 30,),
                        onPressed: () {
                           // debugger();
                           _resetOrientation();
                          
                      PIPView.of(context)?.presentBelow(const mainScreen());
                      setState(() {
                        
                      });
                        },
                      ),
                    ],
                  ),
                ],
              ),
          
            ],
          ),
        ),
        Positioned(
          left: 8,
          right: 8,
          top: MediaQuery.of(context).size.height / 2 - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10, color: Colors.white, size: 36),
                onPressed: () {
                  _controller!.seekTo(
                    _controller!.value.position - Duration(seconds: 10),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10, color: Colors.white, size: 36),
                onPressed: () {
                  _controller!.seekTo(
                    _controller!.value.position + Duration(seconds: 10),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildMinimizedPlayer() {
  return LayoutBuilder(
    builder: (context, constraints) {
      // Ensure the draggable player stays within the screen bounds
      double maxX = constraints.maxWidth - 50; // Width of the minimized player
      double maxY = constraints.maxHeight - 30; // Height of the minimized player

      return Positioned(
        left: _pipOffset.dx.clamp(0, maxX), // Clamp the position to prevent overflow
        top: _pipOffset.dy.clamp(0, maxY),
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _pipOffset = Offset(
                (_pipOffset.dx + details.delta.dx).clamp(0, maxX),
                (_pipOffset.dy + details.delta.dy).clamp(0, maxY),
              );
            });
          },
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_playerManager.controller),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: (){
                    
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


  String _formatDuration(Duration position) {
    final minutes = position.inMinutes;
    final seconds = position.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }


  Widget _buildVideoPlayer(){
    return PIPView(
      builder: (context,isFloating) {
        return Scaffold(
          
          body:Stack(
            children: [
              _controller!.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _showControls = !_showControls;
                        });
                      },
                      child: Stack(
                        children: [
                         VideoPlayer(_controller!),
                          if (_showControls) _buildControls(),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),

                  Positioned(
            bottom: 8.5,
            right: 8.5,
            child: IconButton(
              icon: Icon(Icons.fullscreen, color: Colors.white,size: 30,),
              onPressed: () {
                
                  // Trigger PIP to show below the main screen when minimized
                  _resetOrientation();
                  PIPView.of(context)?.presentBelow(mainScreen());
                  
                _isMinimized=true;
                //  else {
                //   debugger();
                //   _setLandscapeOrientation();
                //   PIPView.of(context)?.deactivate();
                //   // Handle the state for when it is not minimized
                //   // Reset or move back to full-screen if necessary
                // }
              },
            ),
          ),

          
            ],
          ),
        );
      }
    );
  }




  void _showControlPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: AppColor.primaryTransparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brightness Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brightness",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.brightness_6, color: Colors.white),
                          Expanded(
                            child: Slider(
                              value: _brightness,
                              onChanged: (value) {
                                setState(() {
                                  _brightness = value;
                                });
                                _setBrightness(value);
                              },
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey,
                              min: 0.0,
                              max: 1.0,
                            ),
                          ),
                          Text(
                            (_brightness * 100).toStringAsFixed(0) + "%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                
                      // Audio Volume Section
                      Text(
                        "Audio Volume",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.volume_up, color: Colors.white),
                          Expanded(
                            child: Slider(
                              value: _volume,
                              min: 0.0,
                              max: 1.0,
                              onChanged: (value) {
                                setState(() {
                                  _volume = value;
                                });
                                _setVolume(value);
                              },
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                          Text(
                            (_volume * 100).toStringAsFixed(0) + "%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                
                      // Playback Speed Section
                      Text(
                        "Playback Speed",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.speed, color: Colors.white),
                          Expanded(
                            child: Slider(
                              value: _playbackSpeed,
                              min: 0.5,
                              max: 2.0,
                              divisions: 6,
                              onChanged: (value) {
                                setState(() {
                                  _playbackSpeed = value;
                                });
                                _setPlaybackSpeed(value);
                              },
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                          Text(
                            "${_playbackSpeed.toStringAsFixed(2)}x",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async{
                              await _resetSettings();
                              setState(() {
                                  
                                });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              "RESET",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }


final double defaultBrightness = 0.5;
  final double defaultVolume = 0.7;
  final double defaultPlaybackSpeed = 1.0;
  
  Future<void> _resetSettings() async {
    // Reset all values to their defaults
    await _setBrightness(defaultBrightness);
    await _setVolume(defaultVolume);
    await _setPlaybackSpeed(defaultPlaybackSpeed);
    setState(() {
      _brightness = defaultBrightness;
      _volume = defaultVolume;
      _playbackSpeed = defaultPlaybackSpeed;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _buildVideoPlayer(),
          ],
        ),
      );
  }
}



