# JobsApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**triggerOrphanCleanup**](#triggerorphancleanup) | **POST** /jobs/cleanup-orphans | Manually trigger a scan to find and remove orphaned media records.|
|[**triggerOrphanFileCleanup**](#triggerorphanfilecleanup) | **POST** /jobs/cleanup-orphan-files | Manually trigger a scan to find and remove orphaned files without media records.|

# **triggerOrphanCleanup**
> triggerOrphanCleanup()

This is an asynchronous task that runs in the background.

### Example

```typescript
import {
    JobsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new JobsApi(configuration);

const { status, data } = await apiInstance.triggerOrphanCleanup();
```

### Parameters
This endpoint does not have any parameters.


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
|**202** | The cleanup job has been successfully started. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **triggerOrphanFileCleanup**
> triggerOrphanFileCleanup()

This is an asynchronous task that runs in the background.

### Example

```typescript
import {
    JobsApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new JobsApi(configuration);

const { status, data } = await apiInstance.triggerOrphanFileCleanup();
```

### Parameters
This endpoint does not have any parameters.


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
|**202** | The cleanup job has been successfully started. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

