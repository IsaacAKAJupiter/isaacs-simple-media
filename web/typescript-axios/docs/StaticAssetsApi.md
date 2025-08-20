# StaticAssetsApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**getStaticAsset**](#getstaticasset) | **GET** /static/{path} | Retrieve a static media file. Contains the raw media for the uploaded media items.|
|[**getStaticHLS**](#getstatichls) | **GET** /static/hls/{id}/stream.m3u8 | Retrieve a static HLS stream for a media item. Only for video files.|
|[**getStaticThumbnail**](#getstaticthumbnail) | **GET** /static/thumbnails/{id}.png | Retrieve a static thumbnail for a media item. Only for video files.|

# **getStaticAsset**
> File getStaticAsset()

The actual serving is handled by middleware, this is for documentation purposes only.

### Example

```typescript
import {
    StaticAssetsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new StaticAssetsApi(configuration);

let path: string; //The path to the file in the following format: \"{id}.{extension}\". (default to undefined)

const { status, data } = await apiInstance.getStaticAsset(
    path
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **path** | [**string**] | The path to the file in the following format: \&quot;{id}.{extension}\&quot;. | defaults to undefined|


### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The requested file. |  -  |
|**404** | File not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStaticHLS**
> File getStaticHLS()

The actual serving is handled by middleware, this is for documentation purposes only.

### Example

```typescript
import {
    StaticAssetsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new StaticAssetsApi(configuration);

let id: string; //The ID of the media item. (default to undefined)

const { status, data } = await apiInstance.getStaticHLS(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The ID of the media item. | defaults to undefined|


### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/vnd.apple.mpegurl


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The requested file. |  -  |
|**404** | File not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStaticThumbnail**
> File getStaticThumbnail()

The actual serving is handled by middleware, this is for documentation purposes only.

### Example

```typescript
import {
    StaticAssetsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new StaticAssetsApi(configuration);

let id: string; //The ID of the media item. (default to undefined)

const { status, data } = await apiInstance.getStaticThumbnail(
    id
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **id** | [**string**] | The ID of the media item. | defaults to undefined|


### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/png


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The requested file. |  -  |
|**404** | File not found. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

