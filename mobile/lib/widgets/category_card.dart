import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/media_grid.dart';
import 'package:openapi/openapi.dart';

class CategoryCard extends StatelessWidget {
  final CategoryDto? category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final name = category == null ? 'Uncategorised' : category!.name;
    final description = category?.description?.asString ?? '';

    return Card(
      clipBehavior:
          Clip.antiAlias, // Ensures the image respects the rounded corners
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MediaGridRoute(categoryID: category?.id, title: name),
            ),
          );
        },
        child: Stack(
          children: [
            // Thumbnail and placeholder section
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey.shade800,
                child: _buildThumbnail(category?.thumbnail),
              ),
            ),
            // Gradient overlay and text section
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                        ),
                      ),
                      if (description.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade300,
                              shadows: const [
                                Shadow(blurRadius: 2, color: Colors.black),
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(MediaItemDto? thumbnail) {
    if (thumbnail == null) {
      return const Center(
        child: Icon(Icons.image_outlined, size: 48, color: Colors.grey),
      );
    }

    final isVideo = thumbnail.mediaType.startsWith('video/');
    final thumbnailUrl = isVideo
        ? '${ApiConfig.baseUrl}/static/thumbnails/${thumbnail.id}.png'
        : '${ApiConfig.baseUrl}/static/${thumbnail.id}.${thumbnail.extension_}';

    return CachedNetworkImage(
      imageUrl: thumbnailUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.redAccent),
    );
  }
}
