import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/media_viewer.dart';
import 'package:isaacs_simple_media_mobile/routes/provision.dart';
import 'package:isaacs_simple_media_mobile/widgets/category_card.dart';
import 'package:openapi/openapi.dart';

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({super.key});

  @override
  State<CategoriesRoute> createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  List<CategoryDto>? categories;
  List<CategoryTagDto>? categoryTags;
  List<CategoryDto> filteredCategories = [];
  List<num> selectedCategoryTags = [];
  String filter = '';

  final categoriesApi = CategoriesApi(ApiConfig.dio(), standardSerializers);
  final categoryTagsApi = CategoryTagsApi(ApiConfig.dio(), standardSerializers);
  final mediaItemApi = MediaItemApi(ApiConfig.dio(), standardSerializers);

  @override
  void initState() {
    super.initState();

    if (!ApiConfig.isProvisioned()) {
      _redirectToProvision();
    } else {
      _getCategories();
      _getCategoryTags();
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
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProvisionRoute()),
              );
            },
          ),
        ],
      ),
      body: categories == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await _getCategories();
                await _getCategoryTags();
              },
              child: ListView.builder(
                itemCount: filteredCategories.length + 4,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return buildTags();
                  }

                  if (index == 1) {
                    return buildFilterInput();
                  }

                  if (index == 2) {
                    return buildShuffleAllButton();
                  }

                  if (index == 3) {
                    return CategoryCard(category: null);
                  }

                  final category = filteredCategories[index - 4];
                  return CategoryCard(category: category);
                },
              ),
            ),
    );
  }

  Padding buildFilterInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search categories',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          filter = value;
          setState(() {});
          _filterCategories();
        },
      ),
    );
  }

  Padding buildShuffleAllButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: _shuffleAll,
        child: const Text('Shuffle All'),
      ),
    );
  }

  Wrap buildTags() {
    return Wrap(
      spacing: 5.0,
      children:
          categoryTags?.map((tag) {
            final rawTagColour = tag.colour.isNotEmpty ? tag.colour : '#000000';
            final tagColour = Color(
              int.parse(rawTagColour.substring(1, 7), radix: 16) + 0xFF000000,
            );
            final isDark = tagColour.computeLuminance() < 0.5;
            final textColour = isDark ? Colors.white : Colors.black;

            return ChoiceChip(
              label: Text(tag.name, style: TextStyle(color: textColour)),
              selected: selectedCategoryTags.contains(tag.id),
              onSelected: (selected) {
                if (selected) {
                  selectedCategoryTags.add(tag.id);
                } else {
                  selectedCategoryTags.remove(tag.id);
                }
                setState(() {});
                _filterCategories();
              },
              backgroundColor: tagColour,
              selectedColor: tagColour,
              checkmarkColor: textColour,
            );
          }).toList() ??
          [],
    );
  }

  void _filterCategories() {
    final filterLower = filter.toLowerCase();
    filteredCategories =
        categories?.where((category) {
          if (filterLower.isNotEmpty &&
              !category.name.toLowerCase().contains(filterLower)) {
            return false;
          }

          final categoryTagIDs =
              category.tags?.map((tag) => tag.id).toList() ?? [];
          if (selectedCategoryTags.isNotEmpty &&
              !categoryTagIDs.any((id) => selectedCategoryTags.contains(id))) {
            return false;
          }

          return true;
        }).toList() ??
        [];
    setState(() {});
  }

  Future<void> _getCategories() async {
    final response = await categoriesApi.findAll();
    categories = response.data?.toList() ?? [];
    filteredCategories = categories?.toList() ?? [];
    setState(() {});
  }

  Future<void> _getCategoryTags() async {
    final response = await categoryTagsApi.getCategoryTags();
    categoryTags = response.data?.toList() ?? [];
    setState(() {});
  }

  Future<void> _shuffleAll() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response = await mediaItemApi.findAllMediaItems();
      final items = response.data?.toList() ?? [];

      if (items.isEmpty) {
        if (mounted) Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No media items to shuffle')),
        );
        return;
      }

      items.shuffle();

      if (mounted) {
        Navigator.of(context).pop();
        showGeneralDialog(
          context: context,
          barrierDismissible: false,
          fullscreenDialog: true,
          pageBuilder: (_, _, _) {
            return MediaViewerRoute(
              mediaItems: items,
              initialIndex: 0,
              ignoreIncrementViews: true,
              showCategoryInfo: true,
            );
          },
          transitionBuilder: (ctx, a1, a2, child) {
            return FadeTransition(opacity: a1, child: child);
          },
          transitionDuration: const Duration(milliseconds: 200),
        );
      }
    } catch (e) {
      if (mounted) Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error fetching media: $e')));
    }
  }
}
