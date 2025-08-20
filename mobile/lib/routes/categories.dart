import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/media_grid.dart';
import 'package:isaacs_simple_media_mobile/routes/provision.dart';
import 'package:openapi/openapi.dart';

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({super.key});

  @override
  State<CategoriesRoute> createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  late Future<List<CategoryDto>> futureCategories;

  final categoriesApi = CategoriesApi(ApiConfig.dio, standardSerializers);

  @override
  void initState() {
    super.initState();

    if (!ApiConfig.isProvisioned()) {
      _redirectToProvision();
    } else {
      futureCategories = _getCategories();
    }
  }

  void _redirectToProvision() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProvisionRoute()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ApiConfig.isProvisioned()) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProvisionRoute()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<CategoryDto>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found.'));
          } else {
            return ListView(
              children: [
                ListTile(
                  leading: const SizedBox(
                    width: 56, // Standard leading width
                    height: 56,
                    child: Icon(Icons.folder_off_outlined, size: 40),
                  ),
                  title: const Text('Uncategorised'),
                  subtitle: const Text('Media without a category'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MediaGridRoute(title: 'Uncategorised'),
                      ),
                    );
                  },
                ),
                ...snapshot.data!.map((category) {
                  return ListTile(
                    leading: SizedBox(
                      width: 56,
                      height: 56,
                      child: _buildCategoryThumbnail(category.thumbnail),
                    ),
                    title: Text(category.name),
                    subtitle: Text(category.description?.toString() ?? ''),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MediaGridRoute(
                            categoryID: category.id,
                            title: category.name,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryThumbnail(MediaItemDto? thumbnail) {
    if (thumbnail == null) {
      return const Icon(Icons.folder_outlined, size: 40);
    }

    final isVideo = thumbnail.mediaType.startsWith('video/');
    final isGIF = thumbnail.mediaType.startsWith('image/gif');
    final thumbnailUrl = isVideo || isGIF
        ? '${ApiConfig.baseUrl}/static/thumbnails/${thumbnail.id}.png'
        : '${ApiConfig.baseUrl}/static/${thumbnail.id}.${thumbnail.extension_}';

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: thumbnailUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Future<List<CategoryDto>> _getCategories() async {
    final response = await categoriesApi.findAll();
    return response.data?.toList() ?? [];
  }
}
