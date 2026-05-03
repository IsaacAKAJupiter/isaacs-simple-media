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
    this.ignoreIncrementViews = false,
    this.showCategoryInfo = false,
  });

  final List<MediaItemDto> mediaItems;
  final int initialIndex;
  final bool ignoreIncrementViews;
  final bool showCategoryInfo;

  @override
  State<MediaViewerRoute> createState() => _MediaViewerRouteState();
}

class _MediaViewerRouteState extends State<MediaViewerRoute> {
  late PageController _pageController;
  late int _currentIndex;
  bool _isZoomed = false;
  bool _showUI = true;

  final mediaItemsApi = MediaItemApi(ApiConfig.dio(), standardSerializers);

  void _onScaleChanged(bool isZoomed) {
    setState(() => _isZoomed = isZoomed);
  }

  void _toggleUI() {
    setState(() => _showUI = !_showUI);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _incrementMediaItemViews(_currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.mediaItems[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: (!widget.showCategoryInfo && _showUI)
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      body: Stack(
        children: [
          GestureDetector(
            onTap: _toggleUI,
            behavior: HitTestBehavior.opaque,
            child: PageView.builder(
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
                _incrementMediaItemViews(index);
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
          ),

          if (widget.showCategoryInfo)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: !_showUI,
                child: AnimatedOpacity(
                  opacity: _showUI ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: _buildCategoryHeader(context, currentItem),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(BuildContext context, MediaItemDto item) {
    final category = item.categories.firstOrNull;
    final categoryName = category?.name ?? 'Uncategorised';

    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        top: topPadding + 8,
        bottom: 16,
        left: 16,
        right: 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.85),
            Colors.black.withValues(alpha: 0.4),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: 44,
              height: 44,
              child: _buildThumbnail(category?.thumbnail),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 3, color: Colors.black54)],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(MediaItemDto? thumbnail) {
    if (thumbnail == null) {
      return Container(
        color: Colors.grey.shade800,
        child: const Center(
          child: Icon(Icons.image_outlined, size: 24, color: Colors.grey),
        ),
      );
    }

    final isVideo = thumbnail.mediaType.startsWith('video/');
    final thumbnailUrl = isVideo
        ? '${ApiConfig.baseUrl}/static/thumbnails/${thumbnail.id}.png'
        : '${ApiConfig.baseUrl}/static/${thumbnail.id}.${thumbnail.extension_}';

    return CachedNetworkImage(
      imageUrl: thumbnailUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2.0),
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.redAccent),
    );
  }

  Future<void> _incrementMediaItemViews(int index) async {
    if (widget.ignoreIncrementViews) return;
    if (index < 0 || index >= widget.mediaItems.length) return;

    final item = widget.mediaItems[index];
    try {
      await mediaItemsApi.incrementViews(id: item.id);
    } catch (e) {
      debugPrint('Error incrementing views for ${item.id}: $e');
    }
  }
}
