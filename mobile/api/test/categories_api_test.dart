import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CategoriesApi
void main() {
  final instance = Openapi().getCategoriesApi();

  group(CategoriesApi, () {
    // Add a tag to a category
    //
    //Future<CategoryDto> addTag(String id, AddCategoryTagDto addCategoryTagDto) async
    test('test addTag', () async {
      // TODO
    });

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

    // Remove a tag from a category
    //
    //Future<CategoryDto> removeTag(String id, num tagID) async
    test('test removeTag', () async {
      // TODO
    });

    // Update a category by ID
    //
    //Future<CategoryDto> update(String id, PatchCategoryDto patchCategoryDto) async
    test('test update', () async {
      // TODO
    });

  });
}
