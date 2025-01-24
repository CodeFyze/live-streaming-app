import 'package:video_player/video_player.dart';

class GlobalVideoPlayerManager {
  static final GlobalVideoPlayerManager _instance = GlobalVideoPlayerManager._internal();
  VideoPlayerController? _controller;

  factory GlobalVideoPlayerManager() => _instance;

  GlobalVideoPlayerManager._internal();

  VideoPlayerController get controller {
    if (_controller == null) {
      throw Exception("VideoPlayerController is not initialized");
    }
    return _controller!;
  }

  Future<void> initialize(String videoUrl) async {
    if (_controller != null && _controller!.value.isInitialized) {
      if (_controller!.dataSource == videoUrl) {
        // Same video, reuse controller
        return;
      } else {
        // Different video, dispose the current controller
        await _controller!.dispose();
      }
    }
    _controller = VideoPlayerController.network(videoUrl);
    await _controller!.initialize();
  }

  bool get isInitialized => _controller != null && _controller!.value.isInitialized;

  void dispose() {
    _controller?.dispose();
    _controller = null;
  }
}
