# openapi.api.MediaItemApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addMediaItemToCategory**](MediaItemApi.md#addmediaitemtocategory) | **POST** /media-item/{id}/category | Add a media item to a category.
[**deleteItem**](MediaItemApi.md#deleteitem) | **DELETE** /media-item/{id} | Fully delete a media item.
[**getMediaItem**](MediaItemApi.md#getmediaitem) | **GET** /media-item/{id} | Retrieve a media item by ID
[**recycleMediaItem**](MediaItemApi.md#recyclemediaitem) | **PATCH** /media-item/{id}/recycle | Move a media item to the recycle bin (soft delete)
[**recycledMediaItems**](MediaItemApi.md#recycledmediaitems) | **GET** /media-item/recycled | Get all media items that are in the trash.
[**removeMediaItemFromCategory**](MediaItemApi.md#removemediaitemfromcategory) | **DELETE** /media-item/{id}/category | Remove a media item from a category.
[**unRecycleMediaItem**](MediaItemApi.md#unrecyclemediaitem) | **PATCH** /media-item/{id}/un-recycle | Restore a media item from the recycle bin
[**uncategorisedMediaItems**](MediaItemApi.md#uncategorisedmediaitems) | **GET** /media-item/uncategorised | Get all media items that are not in any categories.
[**uploadFile**](MediaItemApi.md#uploadfile) | **POST** /media-item/upload | Upload a single media file


# **addMediaItemToCategory**
> MediaItemDto addMediaItemToCategory(id, addOrRemoveSingleCategoryDto)

Add a media item to a category.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The UUID of the media item.
final AddOrRemoveSingleCategoryDto addOrRemoveSingleCategoryDto = ; // AddOrRemoveSingleCategoryDto | The body containing the category ID.

try {
    final response = api.addMediaItemToCategory(id, addOrRemoveSingleCategoryDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->addMediaItemToCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The UUID of the media item. | 
 **addOrRemoveSingleCategoryDto** | [**AddOrRemoveSingleCategoryDto**](AddOrRemoveSingleCategoryDto.md)| The body containing the category ID. | 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteItem**
> deleteItem(id)

Fully delete a media item.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The UUID of the media item.

try {
    api.deleteItem(id);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->deleteItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The UUID of the media item. | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaItem**
> MediaItemDto getMediaItem(id)

Retrieve a media item by ID

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = id_example; // String | The ID of the media item to retrieve

try {
    final response = api.getMediaItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->getMediaItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the media item to retrieve | 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recycleMediaItem**
> MediaItemDto recycleMediaItem(id)

Move a media item to the recycle bin (soft delete)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The UUID of the media item.

try {
    final response = api.recycleMediaItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->recycleMediaItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The UUID of the media item. | 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recycledMediaItems**
> BuiltList<MediaItemDto> recycledMediaItems()

Get all media items that are in the trash.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();

try {
    final response = api.recycledMediaItems();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->recycledMediaItems: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;MediaItemDto&gt;**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeMediaItemFromCategory**
> MediaItemDto removeMediaItemFromCategory(id, addOrRemoveSingleCategoryDto)

Remove a media item from a category.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The UUID of the media item.
final AddOrRemoveSingleCategoryDto addOrRemoveSingleCategoryDto = ; // AddOrRemoveSingleCategoryDto | The body containing the category ID.

try {
    final response = api.removeMediaItemFromCategory(id, addOrRemoveSingleCategoryDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->removeMediaItemFromCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The UUID of the media item. | 
 **addOrRemoveSingleCategoryDto** | [**AddOrRemoveSingleCategoryDto**](AddOrRemoveSingleCategoryDto.md)| The body containing the category ID. | 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unRecycleMediaItem**
> MediaItemDto unRecycleMediaItem(id)

Restore a media item from the recycle bin

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The UUID of the media item.

try {
    final response = api.unRecycleMediaItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->unRecycleMediaItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The UUID of the media item. | 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uncategorisedMediaItems**
> BuiltList<MediaItemDto> uncategorisedMediaItems()

Get all media items that are not in any categories.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();

try {
    final response = api.uncategorisedMediaItems();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->uncategorisedMediaItems: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;MediaItemDto&gt;**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadFile**
> MediaItemDto uploadFile(file, categoryID)

Upload a single media file

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaItemApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final String categoryID = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Optional UUID of the category to add this media to.

try {
    final response = api.uploadFile(file, categoryID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaItemApi->uploadFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 
 **categoryID** | **String**| Optional UUID of the category to add this media to. | [optional] 

### Return type

[**MediaItemDto**](MediaItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

