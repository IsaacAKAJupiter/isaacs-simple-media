# openapi.model.CategoryDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier for the category | 
**name** | **String** | Name of the category | 
**description** | [**JsonObject**](.md) | Description of the category | 
**thumbnail** | [**MediaItemDto**](MediaItemDto.md) | Thumbnail media item | 
**createdAt** | [**DateTime**](DateTime.md) | Creation date of the category | 
**updatedAt** | [**DateTime**](DateTime.md) | Last update date of the category | 
**tags** | [**BuiltList&lt;CategoryTagDto&gt;**](CategoryTagDto.md) | Tags associated with the category | [optional] 
**mediaItems** | [**BuiltList&lt;MediaItemDto&gt;**](MediaItemDto.md) | List of media items associated with the category | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


