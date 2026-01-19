import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/widgets/custom_chewie_controls.dart';
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
  bool _displayForwardSeek = false;
  bool _displayBackwardSeek = false;
  Timer? _seekTimer;

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
          allowedScreenSleep: false,
          customControls: const CustomChewieControls(),
        );
      });
    }
  }

  @override
  void didUpdateWidget(covariant ZoomableVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.shouldPlay != oldWidget.shouldPlay) {
      if (widget.shouldPlay && _chewieController?.isPlaying == false) {
        _chewieController?.play();
      } else if (!widget.shouldPlay && _chewieController?.isPlaying == true) {
        _chewieController?.pause();
      }
    }
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onScaleUpdate);
    _transformationController.dispose();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _seekTimer?.cancel();
    super.dispose();
  }

  void _seekRelative(int seconds) {
    if (_chewieController == null) return;
    final newPosition =
        _videoPlayerController.value.position + Duration(seconds: seconds);
    _videoPlayerController.seekTo(newPosition);
    _showSeekIndicator(seconds > 0);
  }

  void _showSeekIndicator(bool isForward) {
    setState(() {
      if (isForward) {
        _displayForwardSeek = true;
        _displayBackwardSeek = false;
      } else {
        _displayBackwardSeek = true;
        _displayForwardSeek = false;
      }
    });

    _seekTimer?.cancel();
    _seekTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _displayForwardSeek = false;
          _displayBackwardSeek = false;
        });
      }
    });
  }

  Widget _buildSeekIndicator(bool isForward) {
    final isVisible = isForward ? _displayForwardSeek : _displayBackwardSeek;
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Align(
          alignment: isForward ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.horizontal(
                left: isForward ? const Radius.circular(100) : Radius.zero,
                right: isForward ? Radius.zero : const Radius.circular(100),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isForward ? Icons.fast_forward : Icons.fast_rewind,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isForward ? '+5s' : '-5s',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? Stack(
              children: [
                InteractiveViewer(
                  transformationController: _transformationController,
                  panEnabled: true,
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Chewie(controller: _chewieController!),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onDoubleTapDown: (details) {
                    final width = MediaQuery.of(context).size.width;
                    final isForward = details.globalPosition.dx > width / 2;
                    _seekRelative(isForward ? 5 : -5);
                  },
                  onDoubleTap: () {},
                ),
                _buildSeekIndicator(false),
                _buildSeekIndicator(true),
              ],
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
