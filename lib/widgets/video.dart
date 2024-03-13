import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isFullScreen = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..addListener(() {
        setState(() {});
      });
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _onSliderChanged(double value) {
    final Duration duration = _controller.value.duration;
    final newPosition = value * duration.inMilliseconds;
    _controller.seekTo(Duration(milliseconds: newPosition.round()));
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:"
        "${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: _togglePlayPause,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white),
                        onPressed: _togglePlayPause,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          _formatDuration(_controller.value.position),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                            thumbColor: Colors.white,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                          child: Slider(
                            value: _controller.value.position.inMilliseconds
                                .toDouble(),
                            min: 0.0,
                            max: _controller.value.duration.inMilliseconds
                                .toDouble(),
                            onChanged: (value) {
                              _onSliderChanged(value /
                                  _controller.value.duration.inMilliseconds);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          _formatDuration(_controller.value.duration -
                              _controller.value.position),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                            _isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white),
                        onPressed: _toggleMute,
                      ),
                      IconButton(
                        icon: Icon(
                            _isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            color: Colors.white),
                        onPressed: _toggleFullScreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
