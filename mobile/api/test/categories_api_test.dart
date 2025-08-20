import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CategoriesApi
void main() {
  final instance = Openapi().getCategoriesApi();

  group(CategoriesApi, () {
    // Create a new category
    //
    //Future<CategoryDto> create(CreateCategoryDto createCategoryDto) async
    test('test create', () async {
      // TODO
    });

    // Retrieve all categories
    //
    //Future<BuiltList<CategoryDto>> findAll() async
    test('test findAll', () async {
      // TODO
    });

    // Retrieve a category by ID
    //
    //Future<CategoryDto> findOne(String id) async
    test('test findOne', () async {
      // TODO
    });

    // Delete a category by ID
    //
    //Future remove(String id) async
    test('test remove', () async {
      // TODO
    });

    // Update a category by ID
    //
    //Future<CategoryDto> update(String id, JsonObject body) async
    test('test update', () async {
      // TODO
    });

  });
}
