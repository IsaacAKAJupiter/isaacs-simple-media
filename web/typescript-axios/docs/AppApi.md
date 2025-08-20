# AppApi

All URIs are relative to *http://localhost*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**health**](#health) | **GET** /health | |

# **health**
> health()


### Example

```typescript
import {
    AppApi,
    Configuration
} from './api';

const configuration = new Configuration();
const apiInstance = new AppApi(configuration);

const { status, data } = await apiInstance.health();
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
|**200** | Application is running. |  -  |
|**500** | Internal server error. |  -  |
|**502** | Bad gateway. |  -  |
|**503** | Service unavailable. |  -  |
|**504** | Gateway timeout. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

