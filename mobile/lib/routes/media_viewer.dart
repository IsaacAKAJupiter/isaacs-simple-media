import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/widgets/zoomable_video_player.dart';
import 'package:openapi/openapi.dart';
import 'package:photo_view/photo_view.dart';

class MediaViewerRoute extends StatefulWidget {
  const MediaViewerRoute({
    super.key,
    required this.mediaItems,
    required this.initialIndex,
  });

  final List<MediaItemDto> mediaItems;
  final int initialIndex;

  @override
  State<MediaViewerRoute> createState() => _MediaViewerRouteState();
}

class _MediaViewerRouteState extends State<MediaViewerRoute> {
  late PageController _pageController;
  late int _currentIndex;
  bool _isZoomed = false;

  void _onScaleChanged(bool isZoomed) {
    setState(() => _isZoomed = isZoomed);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        physics: _isZoomed
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: widget.mediaItems.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _isZoomed = false;
          });
        },
        itemBuilder: (context, index) {
          final item = widget.mediaItems[index];
          final isVideo = item.mediaType.startsWith('video/');

          if (isVideo) {
            final hlsUrl =
                '${ApiConfig.baseUrl}/static/hls/${item.id}/stream.m3u8';
            return ZoomableVideoPlayer(
              key: ValueKey('${item.id}_$index'),
              videoUrl: hlsUrl,
              shouldPlay: index == _currentIndex,
              onScaleChanged: _onScaleChanged,
            );
          } else {
            final imageUrl =
                '${ApiConfig.baseUrl}/static/${item.id}.${item.extension_}';
            return PhotoView(
              imageProvider: CachedNetworkImageProvider(imageUrl),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: item.id),
              scaleStateChangedCallback: (state) {
                _onScaleChanged(state != PhotoViewScaleState.initial);
              },
            );
          }
        },
      ),
    );
  }
}
