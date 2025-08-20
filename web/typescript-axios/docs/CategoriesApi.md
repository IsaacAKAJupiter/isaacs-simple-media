# CategoriesApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**create**](#create) | **POST** /category | Create a new category|
|[**findAll**](#findall) | **GET** /category | Retrieve all categories|
|[**findOne**](#findone) | **GET** /category/{id} | Retrieve a category by ID|
|[**remove**](#remove) | **DELETE** /category/{id} | Delete a category by ID|
|[**update**](#update) | **PATCH** /category/{id} | Update a category by ID|

# **create**
> CategoryDto create(createCategoryDto)


### Example

```typescript
import {
    CategoriesApi,
    Configuration,
    CreateCategoryDto
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoriesApi(configuration);

let createCategoryDto: CreateCategoryDto; //The media file to upload.

const { status, data } = await apiInstance.create(
    createCategoryDto
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **createCategoryDto** | **CreateCategoryDto**| The media file to upload. | |


### Return type

**CategoryDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**201** | The category has been successfully created. |  -  |
|**400** | Bad Request. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findAll**
> Array<CategoryDto> findAll()


### Example

```typescript
import {
    CategoriesApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoriesApi(configuration);

const { status, data } = await apiInstance.findAll();
```

### Parameters
This endpoint does not have any parameters.


### Return type

**Array<CategoryDto>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | List of categories. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findOne**
> CategoryDto findOne()


### Example

```typescript
import {
    CategoriesApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoriesApi(configuration);

let id: string; //The ID of the category to retrieve (default to undefined)

const { status, data } = await apiInstance.findOne(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The ID of the category to retrieve | defaults to undefined|


### Return type

**CategoryDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The category has been successfully retrieved. |  -  |
|**404** | Category not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **remove**
> remove()


### Example

```typescript
import {
    CategoriesApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoriesApi(configuration);

let id: string; //The ID of the category to delete (default to undefined)

const { status, data } = await apiInstance.remove(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The ID of the category to delete | defaults to undefined|


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
|**200** | The category has been successfully deleted. |  -  |
|**404** | Category not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update**
> CategoryDto update(patchCategoryDto)


### Example

```typescript
import {
    CategoriesApi,
    Configuration,
    PatchCategoryDto
} from './api';

const configuration = new Configuration();
const apiInstance = new CategoriesApi(configuration);

let id: string; //The ID of the category to update (default to undefined)
let patchCategoryDto: PatchCategoryDto; //Partial category body.

const { status, data } = await apiInstance.update(
    id,
    patchCategoryDto
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **patchCategoryDto** | **PatchCategoryDto**| Partial category body. | |
| **id** | [**string**] | The ID of the category to update | defaults to undefined|


### Return type

**CategoryDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The category has been successfully updated. |  -  |
|**400** | Bad Request. |  -  |
|**404** | Category not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

