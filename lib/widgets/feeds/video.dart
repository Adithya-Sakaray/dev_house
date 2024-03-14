import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPage({Key? key, required this.controller})
      : super(key: key);

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late bool _showControls;
  late Timer _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _showControls = true;
    _hideControlsTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  void dispose() {
    _hideControlsTimer.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (widget.controller.value.isPlaying) {
        widget.controller.pause();
      } else {
        widget.controller.play();
      }
    });
    _resetHideControlsTimer();
  }

  void _onSliderChanged(double value) {
    final Duration duration = widget.controller.value.duration;
    final newPosition = value * duration.inMilliseconds;
    widget.controller.seekTo(Duration(milliseconds: newPosition.round()));
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:"
        "${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Colors.black54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        widget.controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _togglePlayPause,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        _formatDuration(widget.controller.value.position),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Color.fromARGB(255, 250, 248, 248),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                        child: Slider(
                          value: widget.controller.value.position.inMilliseconds
                              .toDouble(),
                          min: 0.0,
                          max: widget.controller.value.duration.inMilliseconds
                              .toDouble(),
                          onChanged: (value) {
                            _onSliderChanged(value /
                                widget
                                    .controller.value.duration.inMilliseconds);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        _formatDuration(widget.controller.value.duration -
                            widget.controller.value.position),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Implement volume controls
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  final bool _isFullScreen = false;
  bool _isMuted = false;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) {
      setState(() {});
    });
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
    _showControls = true; // Show controls when play/pause is toggled
    _startHideControlsTimer();
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
    // setState(() {
    //   _isFullScreen = !_isFullScreen;
    // });
    // if (_isFullScreen) {
    //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // } else {
    //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //       overlays: SystemUiOverlay.values);
    // }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPage(controller: _controller),
      ),
    );
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _startHideControlsTimer() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls = !_showControls;
          if (_showControls) {
            _startHideControlsTimer();
          }
        });
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          AnimatedOpacity(
            opacity: _showControls ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
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
                        thumbColor: Color.fromARGB(255, 250, 248, 248),
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
                      color: Colors.white,
                    ),
                    onPressed: _toggleMute,
                  ),
                  IconButton(
                    icon: Icon(
                      _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                      color: Colors.white,
                    ),
                    onPressed: _toggleFullScreen,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
