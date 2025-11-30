# openapi.api.CategoryTagsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCategoryTag**](CategoryTagsApi.md#createcategorytag) | **POST** /category-tag | Create a new category tag
[**deleteCategoryTag**](CategoryTagsApi.md#deletecategorytag) | **DELETE** /category-tag/{id} | Delete a category tag
[**getCategoryTags**](CategoryTagsApi.md#getcategorytags) | **GET** /category-tag | Get all category tags


# **createCategoryTag**
> CategoryTagDto createCategoryTag(createCategoryTagDto)

Create a new category tag

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoryTagsApi();
final CreateCategoryTagDto createCategoryTagDto = ; // CreateCategoryTagDto | The category tag to create.

try {
    final response = api.createCategoryTag(createCategoryTagDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoryTagsApi->createCategoryTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCategoryTagDto** | [**CreateCategoryTagDto**](CreateCategoryTagDto.md)| The category tag to create. | 

### Return type

[**CategoryTagDto**](CategoryTagDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCategoryTag**
> deleteCategoryTag(id)

Delete a category tag

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoryTagsApi();
final num id = 8.14; // num | 

try {
    api.deleteCategoryTag(id);
} catch on DioException (e) {
    print('Exception when calling CategoryTagsApi->deleteCategoryTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCategoryTags**
> BuiltList<CategoryTagDto> getCategoryTags()

Get all category tags

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoryTagsApi();

try {
    final response = api.getCategoryTags();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoryTagsApi->getCategoryTags: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CategoryTagDto&gt;**](CategoryTagDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

