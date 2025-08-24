import 'package:flutter/material.dart';
import 'package:isaacs_simple_media_mobile/api_config.dart';
import 'package:isaacs_simple_media_mobile/routes/provision.dart';
import 'package:isaacs_simple_media_mobile/widgets/category_card.dart';
import 'package:openapi/openapi.dart';

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({super.key});

  @override
  State<CategoriesRoute> createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  late Future<List<CategoryDto>> futureCategories;

  final categoriesApi = CategoriesApi(ApiConfig.dio(), standardSerializers);

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
            icon: const Icon(Icons.logout),
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
            final allCategories = [...snapshot.data!];

            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: allCategories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CategoryCard(category: null);
                }

                return CategoryCard(category: allCategories[index - 1]);
              },
            );
          }
        },
      ),
    );
  }

  Future<List<CategoryDto>> _getCategories() async {
    final response = await categoriesApi.findAll();
    return response.data?.toList() ?? [];
  }
}
