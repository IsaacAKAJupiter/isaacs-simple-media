# openapi.model.PatchCategoryDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier for the category | [optional] 
**name** | **String** | Name of the category | [optional] 
**description** | [**JsonObject**](.md) | Description of the category | [optional] 
**thumbnail** | [**MediaItemDto**](MediaItemDto.md) | Thumbnail media item | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Creation date of the category | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) | Last update date of the category | [optional] 
**tags** | [**BuiltList&lt;CategoryTagDto&gt;**](CategoryTagDto.md) | Tags associated with the category | [optional] 
**mediaItems** | [**BuiltList&lt;MediaItemDto&gt;**](MediaItemDto.md) | List of media items associated with the category | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


