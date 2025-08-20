import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MediaItemApi
void main() {
  final instance = Openapi().getMediaItemApi();

  group(MediaItemApi, () {
    // Add a media item to a category.
    //
    //Future<MediaItemDto> addMediaItemToCategory(String id, AddOrRemoveSingleCategoryDto addOrRemoveSingleCategoryDto) async
    test('test addMediaItemToCategory', () async {
      // TODO
    });

    // Fully delete a media item.
    //
    //Future deleteItem(String id) async
    test('test deleteItem', () async {
      // TODO
    });

    // Retrieve a media item by ID
    //
    //Future<MediaItemDto> getMediaItem(String id) async
    test('test getMediaItem', () async {
      // TODO
    });

    // Move a media item to the recycle bin (soft delete)
    //
    //Future<MediaItemDto> recycleMediaItem(String id) async
    test('test recycleMediaItem', () async {
      // TODO
    });

    // Get all media items that are in the trash.
    //
    //Future<BuiltList<MediaItemDto>> recycledMediaItems() async
    test('test recycledMediaItems', () async {
      // TODO
    });

    // Remove a media item from a category.
    //
    //Future<MediaItemDto> removeMediaItemFromCategory(String id, AddOrRemoveSingleCategoryDto addOrRemoveSingleCategoryDto) async
    test('test removeMediaItemFromCategory', () async {
      // TODO
    });

    // Restore a media item from the recycle bin
    //
    //Future<MediaItemDto> unRecycleMediaItem(String id) async
    test('test unRecycleMediaItem', () async {
      // TODO
    });

    // Get all media items that are not in any categories.
    //
    //Future<BuiltList<MediaItemDto>> uncategorisedMediaItems() async
    test('test uncategorisedMediaItems', () async {
      // TODO
    });

    // Upload a single media file
    //
    //Future<MediaItemDto> uploadFile(MultipartFile file, { String categoryID }) async
    test('test uploadFile', () async {
      // TODO
    });

  });
}
