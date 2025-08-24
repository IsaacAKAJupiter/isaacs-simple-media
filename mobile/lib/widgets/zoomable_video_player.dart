import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ZoomableVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool shouldPlay;
  final void Function(bool isZoomed) onScaleChanged;

  const ZoomableVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.shouldPlay,
    required this.onScaleChanged,
  });

  @override
  _ZoomableVideoPlayerState createState() => _ZoomableVideoPlayerState();
}

class _ZoomableVideoPlayerState extends State<ZoomableVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  late TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _transformationController.addListener(_onScaleUpdate);
    _initializePlayer();
  }

  void _onScaleUpdate() {
    final double scale = _transformationController.value.getMaxScaleOnAxis();
    widget.onScaleChanged(scale > 1.0);
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    await _videoPlayerController.initialize();

    if (mounted) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoPlay: widget.shouldPlay,
          looping: true,
          showControlsOnInitialize: false,
        );
      });
    }
  }

  @override
  void didUpdateWidget(covariant ZoomableVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldPlay && _chewieController?.isPlaying == false) {
      _chewieController?.play();
    } else if (!widget.shouldPlay && _chewieController?.isPlaying == true) {
      _chewieController?.pause();
    }
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onScaleUpdate);
    _transformationController.dispose();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? InteractiveViewer(
              transformationController: _transformationController,
              panEnabled: true,
              minScale: 1.0,
              maxScale: 4.0,
              child: Chewie(controller: _chewieController!),
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Initializing Video...'),
              ],
            ),
    );
  }
}
