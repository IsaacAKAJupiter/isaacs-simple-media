# openapi.api.CategoriesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTag**](CategoriesApi.md#addtag) | **POST** /category/{id}/tag | Add a tag to a category
[**create**](CategoriesApi.md#create) | **POST** /category | Create a new category
[**findAll**](CategoriesApi.md#findall) | **GET** /category | Retrieve all categories
[**findOne**](CategoriesApi.md#findone) | **GET** /category/{id} | Retrieve a category by ID
[**remove**](CategoriesApi.md#remove) | **DELETE** /category/{id} | Delete a category by ID
[**removeTag**](CategoriesApi.md#removetag) | **DELETE** /category/{id}/tag/{tagID} | Remove a tag from a category
[**update**](CategoriesApi.md#update) | **PATCH** /category/{id} | Update a category by ID


# **addTag**
> CategoryDto addTag(id, addCategoryTagDto)

Add a tag to a category

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final String id = id_example; // String | The ID of the category to add a tag to
final AddCategoryTagDto addCategoryTagDto = ; // AddCategoryTagDto | Tag ID to add.

try {
    final response = api.addTag(id, addCategoryTagDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->addTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the category to add a tag to | 
 **addCategoryTagDto** | [**AddCategoryTagDto**](AddCategoryTagDto.md)| Tag ID to add. | 

### Return type

[**CategoryDto**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create**
> CategoryDto create(createCategoryDto)

Create a new category

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final CreateCategoryDto createCategoryDto = ; // CreateCategoryDto | The media file to upload.

try {
    final response = api.create(createCategoryDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->create: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCategoryDto** | [**CreateCategoryDto**](CreateCategoryDto.md)| The media file to upload. | 

### Return type

[**CategoryDto**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findAll**
> BuiltList<CategoryDto> findAll()

Retrieve all categories

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();

try {
    final response = api.findAll();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->findAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CategoryDto&gt;**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findOne**
> CategoryDto findOne(id)

Retrieve a category by ID

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final String id = id_example; // String | The ID of the category to retrieve

try {
    final response = api.findOne(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->findOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the category to retrieve | 

### Return type

[**CategoryDto**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **remove**
> remove(id)

Delete a category by ID

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final String id = id_example; // String | The ID of the category to delete

try {
    api.remove(id);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->remove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the category to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeTag**
> CategoryDto removeTag(id, tagID)

Remove a tag from a category

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final String id = id_example; // String | The ID of the category to remove a tag from
final num tagID = 8.14; // num | The ID of the tag to remove

try {
    final response = api.removeTag(id, tagID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->removeTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the category to remove a tag from | 
 **tagID** | **num**| The ID of the tag to remove | 

### Return type

[**CategoryDto**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update**
> CategoryDto update(id, patchCategoryDto)

Update a category by ID

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCategoriesApi();
final String id = id_example; // String | The ID of the category to update
final PatchCategoryDto patchCategoryDto = ; // PatchCategoryDto | Partial category body.

try {
    final response = api.update(id, patchCategoryDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->update: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the category to update | 
 **patchCategoryDto** | [**PatchCategoryDto**](PatchCategoryDto.md)| Partial category body. | 

### Return type

[**CategoryDto**](CategoryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

