import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for StaticAssetsApi
void main() {
  final instance = Openapi().getStaticAssetsApi();

  group(StaticAssetsApi, () {
    // Retrieve a static media file. Contains the raw media for the uploaded media items.
    //
    // The actual serving is handled by middleware, this is for documentation purposes only.
    //
    //Future<Uint8List> getStaticAsset(String path) async
    test('test getStaticAsset', () async {
      // TODO
    });

    // Retrieve a static HLS stream for a media item. Only for video files.
    //
    // The actual serving is handled by middleware, this is for documentation purposes only.
    //
    //Future<Uint8List> getStaticHLS(String id) async
    test('test getStaticHLS', () async {
      // TODO
    });

    // Retrieve a static thumbnail for a media item. Only for video files.
    //
    // The actual serving is handled by middleware, this is for documentation purposes only.
    //
    //Future<Uint8List> getStaticThumbnail(String id) async
    test('test getStaticThumbnail', () async {
      // TODO
    });

  });
}
