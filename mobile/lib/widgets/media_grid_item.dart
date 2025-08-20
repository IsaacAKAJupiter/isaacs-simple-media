import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:openapi/openapi.dart';

class MediaGridItem extends StatefulWidget {
  const MediaGridItem({super.key, required this.item, required this.onTap});

  final MediaItemDto item;
  final VoidCallback onTap;

  @override
  State<MediaGridItem> createState() => _MediaGridItemState();
}

class _MediaGridItemState extends State<MediaGridItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final isVideo = widget.item.mediaType.startsWith('video/');
    final isGIF = widget.item.mediaType == 'image/gif';
    final thumbnailUrl = isVideo || isGIF
        ? '${ApiConfig.baseUrl}/static/thumbnails/${widget.item.id}.png'
        : '${ApiConfig.baseUrl}/static/${widget.item.id}.${widget.item.extension_}';

    return GestureDetector(
      onTap: widget.onTap,
      child: GridTile(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: thumbnailUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            if (isVideo || isGIF)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    isVideo ? Icons.videocam_outlined : Icons.gif_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
