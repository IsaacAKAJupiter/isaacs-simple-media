# MediaItemApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**addMediaItemToCategory**](#addmediaitemtocategory) | **POST** /media-item/{id}/category | Add a media item to a category.|
|[**deleteItem**](#deleteitem) | **DELETE** /media-item/{id} | Fully delete a media item.|
|[**getMediaItem**](#getmediaitem) | **GET** /media-item/{id} | Retrieve a media item by ID|
|[**recycleMediaItem**](#recyclemediaitem) | **PATCH** /media-item/{id}/recycle | Move a media item to the recycle bin (soft delete)|
|[**recycledMediaItems**](#recycledmediaitems) | **GET** /media-item/recycled | Get all media items that are in the trash.|
|[**removeMediaItemFromCategory**](#removemediaitemfromcategory) | **DELETE** /media-item/{id}/category | Remove a media item from a category.|
|[**unRecycleMediaItem**](#unrecyclemediaitem) | **PATCH** /media-item/{id}/un-recycle | Restore a media item from the recycle bin|
|[**uncategorisedMediaItems**](#uncategorisedmediaitems) | **GET** /media-item/uncategorised | Get all media items that are not in any categories.|
|[**uploadFile**](#uploadfile) | **POST** /media-item/upload | Upload a single media file|

# **addMediaItemToCategory**
> MediaItemDto addMediaItemToCategory(addOrRemoveSingleCategoryDto)


### Example

```typescript
import {
    MediaItemApi,
    Configuration,
    AddOrRemoveSingleCategoryDto
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The UUID of the media item. (default to undefined)
let addOrRemoveSingleCategoryDto: AddOrRemoveSingleCategoryDto; //The body containing the category ID.

const { status, data } = await apiInstance.addMediaItemToCategory(
    id,
    addOrRemoveSingleCategoryDto
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **addOrRemoveSingleCategoryDto** | **AddOrRemoveSingleCategoryDto**| The body containing the category ID. | |
| **id** | [**string**] | The UUID of the media item. | defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | Item added to category successfully. |  -  |
|**400** | If the media item is already in the category. |  -  |
|**404** | If the media item or category were not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteItem**
> deleteItem()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The UUID of the media item. (default to undefined)

const { status, data } = await apiInstance.deleteItem(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The UUID of the media item. | defaults to undefined|


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
|**200** | Item successfully deleted. |  -  |
|**404** | Media item not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaItem**
> MediaItemDto getMediaItem()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The ID of the media item to retrieve (default to undefined)

const { status, data } = await apiInstance.getMediaItem(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The ID of the media item to retrieve | defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The media item has been successfully retrieved. |  -  |
|**404** | Media item not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recycleMediaItem**
> MediaItemDto recycleMediaItem()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The UUID of the media item. (default to undefined)

const { status, data } = await apiInstance.recycleMediaItem(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The UUID of the media item. | defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | Item moved to recycle bin successfully. |  -  |
|**404** | Media item not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recycledMediaItems**
> Array<MediaItemDto> recycledMediaItems()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

const { status, data } = await apiInstance.recycledMediaItems();
```

### Parameters
This endpoint does not have any parameters.


### Return type

**Array<MediaItemDto>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | A list of media items. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeMediaItemFromCategory**
> MediaItemDto removeMediaItemFromCategory(addOrRemoveSingleCategoryDto)


### Example

```typescript
import {
    MediaItemApi,
    Configuration,
    AddOrRemoveSingleCategoryDto
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The UUID of the media item. (default to undefined)
let addOrRemoveSingleCategoryDto: AddOrRemoveSingleCategoryDto; //The body containing the category ID.

const { status, data } = await apiInstance.removeMediaItemFromCategory(
    id,
    addOrRemoveSingleCategoryDto
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **addOrRemoveSingleCategoryDto** | **AddOrRemoveSingleCategoryDto**| The body containing the category ID. | |
| **id** | [**string**] | The UUID of the media item. | defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | Item removed from category successfully. |  -  |
|**400** | If the media item is not in the category. |  -  |
|**404** | If the media item or category were not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unRecycleMediaItem**
> MediaItemDto unRecycleMediaItem()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let id: string; //The UUID of the media item. (default to undefined)

const { status, data } = await apiInstance.unRecycleMediaItem(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The UUID of the media item. | defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | Item restored from recycle bin successfully. |  -  |
|**404** | Media item not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uncategorisedMediaItems**
> Array<MediaItemDto> uncategorisedMediaItems()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

const { status, data } = await apiInstance.uncategorisedMediaItems();
```

### Parameters
This endpoint does not have any parameters.


### Return type

**Array<MediaItemDto>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | A list of media items. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadFile**
> MediaItemDto uploadFile()


### Example

```typescript
import {
    MediaItemApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new MediaItemApi(configuration);

let file: File; // (default to undefined)
let categoryID: string; //Optional UUID of the category to add this media to. (optional) (default to undefined)

const { status, data } = await apiInstance.uploadFile(
    file,
    categoryID
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **file** | [**File**] |  | defaults to undefined|
| **categoryID** | [**string**] | Optional UUID of the category to add this media to. | (optional) defaults to undefined|


### Return type

**MediaItemDto**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**201** | File uploaded successfully. |  -  |
|**409** | File is a duplicate of an existing item. |  -  |
|**415** | Unsupported file type. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

