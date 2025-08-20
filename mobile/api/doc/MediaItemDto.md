# openapi.model.MediaItemDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique identifier for the media item. | 
**fileName** | **String** | The original filename of the media item. | 
**extension_** | **String** | The file extension of the media item. | 
**size** | **num** | The size of the file in bytes. | 
**contentHash** | **String** | The SHA-256 content hash of the file. | 
**mediaType** | **String** | The MIME type of the file. | 
**thumbnailPath** | [**JsonObject**](.md) | Path to a generated thumbnail for video files. | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**recycledAt** | [**JsonObject**](.md) | If set, the item is considered in the trash. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


