# openapi.api.StaticAssetsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStaticAsset**](StaticAssetsApi.md#getstaticasset) | **GET** /static/{path} | Retrieve a static media file. Contains the raw media for the uploaded media items.
[**getStaticHLS**](StaticAssetsApi.md#getstatichls) | **GET** /static/hls/{id}/stream.m3u8 | Retrieve a static HLS stream for a media item. Only for video files.
[**getStaticThumbnail**](StaticAssetsApi.md#getstaticthumbnail) | **GET** /static/thumbnails/{id}.png | Retrieve a static thumbnail for a media item. Only for video files.


# **getStaticAsset**
> Uint8List getStaticAsset(path)

Retrieve a static media file. Contains the raw media for the uploaded media items.

The actual serving is handled by middleware, this is for documentation purposes only.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStaticAssetsApi();
final String path = path_example; // String | The path to the file in the following format: \"{id}.{extension}\".

try {
    final response = api.getStaticAsset(path);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StaticAssetsApi->getStaticAsset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**| The path to the file in the following format: \"{id}.{extension}\". | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStaticHLS**
> Uint8List getStaticHLS(id)

Retrieve a static HLS stream for a media item. Only for video files.

The actual serving is handled by middleware, this is for documentation purposes only.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStaticAssetsApi();
final String id = id_example; // String | The ID of the media item.

try {
    final response = api.getStaticHLS(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StaticAssetsApi->getStaticHLS: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the media item. | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/vnd.apple.mpegurl

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStaticThumbnail**
> Uint8List getStaticThumbnail(id)

Retrieve a static thumbnail for a media item. Only for video files.

The actual serving is handled by middleware, this is for documentation purposes only.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStaticAssetsApi();
final String id = id_example; // String | The ID of the media item.

try {
    final response = api.getStaticThumbnail(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StaticAssetsApi->getStaticThumbnail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the media item. | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/png

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

