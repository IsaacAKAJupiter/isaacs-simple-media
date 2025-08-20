# openapi.api.AppApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**health**](AppApi.md#health) | **GET** /health | 


# **health**
> health()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAppApi();

try {
    api.health();
} catch on DioException (e) {
    print('Exception when calling AppApi->health: $e\n');
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

