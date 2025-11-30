import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/media_viewer.dart';
import 'package:isaacs_simple_media_mobile/widgets/media_grid_item.dart';
import 'package:openapi/openapi.dart';

class MediaGridRoute extends StatefulWidget {
  const MediaGridRoute({super.key, this.categoryID, required this.title});

  final String? categoryID;
  final String title;

  @override
  State<MediaGridRoute> createState() => _MediaGridRouteState();
}

class _MediaGridRouteState extends State<MediaGridRoute> {
  late Future<List<MediaItemDto>> futureMediaItems;

  final categoriesApi = CategoriesApi(ApiConfig.dio(), standardSerializers);
  final mediaItemsApi = MediaItemApi(ApiConfig.dio(), standardSerializers);

  @override
  void initState() {
    super.initState();

    if (widget.categoryID != null) {
      futureMediaItems = _getCategoryMediaItems(widget.categoryID!);
    } else {
      futureMediaItems = _getUncategorisedMediaItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<List<MediaItemDto>>(
        future: futureMediaItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No media items found.'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return MediaGridItem(
                  key: ValueKey(item.id),
                  item: item,
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      fullscreenDialog: true,
                      pageBuilder: (_, _, _) {
                        return MediaViewerRoute(
                          mediaItems: snapshot.data!,
                          initialIndex: index,
                        );
                      },
                      transitionBuilder: (ctx, a1, a2, child) {
                        return FadeTransition(opacity: a1, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 200),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<MediaItemDto>> _getCategoryMediaItems(final String id) async {
    final response = await categoriesApi.findOne(id: id);
    return response.data?.mediaItems?.toList() ?? [];
  }

  Future<List<MediaItemDto>> _getUncategorisedMediaItems() async {
    final response = await mediaItemsApi.uncategorisedMediaItems();
    return response.data?.toList() ?? [];
  }
}
