# PatchCategoryDto


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **string** | Unique identifier for the category | [optional] [default to undefined]
**name** | **string** | Name of the category | [optional] [default to undefined]
**description** | **object** | Description of the category | [optional] [default to undefined]
**thumbnail** | [**MediaItemDto**](MediaItemDto.md) | Thumbnail media item | [optional] [default to undefined]
**createdAt** | **string** | Creation date of the category | [optional] [default to undefined]
**updatedAt** | **string** | Last update date of the category | [optional] [default to undefined]
**mediaItems** | [**Array&lt;MediaItemDto&gt;**](MediaItemDto.md) | List of media items associated with the category | [optional] [default to undefined]

## Example

```typescript
import { PatchCategoryDto } from './api';

const instance: PatchCategoryDto = {
    id,
    name,
    description,
    thumbnail,
    createdAt,
    updatedAt,
    mediaItems,
};
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
