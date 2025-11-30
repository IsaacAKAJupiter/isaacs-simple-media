# CategoryTagsApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**createCategoryTag**](#createcategorytag) | **POST** /category-tag | Create a new category tag|
|[**deleteCategoryTag**](#deletecategorytag) | **DELETE** /category-tag/{id} | Delete a category tag|
|[**getCategoryTags**](#getcategorytags) | **GET** /category-tag | Get all category tags|

# **createCategoryTag**
> CategoryTagDto createCategoryTag(createCategoryTagDto)


### Example

```typescript
import {
    CategoryTagsApi,
    Configuration,
    CreateCategoryTagDto
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoryTagsApi(configuration);

let createCategoryTagDto: CreateCategoryTagDto; //The category tag to create.

const { status, data } = await apiInstance.createCategoryTag(
    createCategoryTagDto
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **createCategoryTagDto** | **CreateCategoryTagDto**| The category tag to create. | |


### Return type

**CategoryTagDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**201** | The category tag has been successfully created. |  -  |
|**400** | Bad Request. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCategoryTag**
> deleteCategoryTag()


### Example

```typescript
import {
    CategoryTagsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoryTagsApi(configuration);

let id: number; // (default to undefined)

const { status, data } = await apiInstance.deleteCategoryTag(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**number**] |  | defaults to undefined|


### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The category tag has been successfully deleted. |  -  |
|**400** | Bad Request. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCategoryTags**
> Array<CategoryTagDto> getCategoryTags()


### Example

```typescript
import {
    CategoryTagsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoryTagsApi(configuration);

const { status, data } = await apiInstance.getCategoryTags();
```

### Parameters
This endpoint does not have any parameters.


### Return type

**Array<CategoryTagDto>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The category tags have been successfully retrieved. |  -  |
|**400** | Bad Request. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

