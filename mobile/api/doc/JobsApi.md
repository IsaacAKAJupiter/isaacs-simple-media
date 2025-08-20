# openapi.api.JobsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**triggerOrphanCleanup**](JobsApi.md#triggerorphancleanup) | **POST** /jobs/cleanup-orphans | Manually trigger a scan to find and remove orphaned media records.
[**triggerOrphanFileCleanup**](JobsApi.md#triggerorphanfilecleanup) | **POST** /jobs/cleanup-orphan-files | Manually trigger a scan to find and remove orphaned files without media records.


# **triggerOrphanCleanup**
> triggerOrphanCleanup()

Manually trigger a scan to find and remove orphaned media records.

This is an asynchronous task that runs in the background.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getJobsApi();

try {
    api.triggerOrphanCleanup();
} catch on DioException (e) {
    print('Exception when calling JobsApi->triggerOrphanCleanup: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **triggerOrphanFileCleanup**
> triggerOrphanFileCleanup()

Manually trigger a scan to find and remove orphaned files without media records.

This is an asynchronous task that runs in the background.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getJobsApi();

try {
    api.triggerOrphanFileCleanup();
} catch on DioException (e) {
    print('Exception when calling JobsApi->triggerOrphanFileCleanup: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

