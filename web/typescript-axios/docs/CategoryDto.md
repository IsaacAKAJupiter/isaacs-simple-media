# CategoryDto


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **string** | Unique identifier for the category | [default to undefined]
**name** | **string** | Name of the category | [default to undefined]
**description** | **object** | Description of the category | [default to undefined]
**thumbnail** | [**MediaItemDto**](MediaItemDto.md) | Thumbnail media item | [default to undefined]
**createdAt** | **string** | Creation date of the category | [default to undefined]
**updatedAt** | **string** | Last update date of the category | [default to undefined]
**tags** | [**Array&lt;CategoryTagDto&gt;**](CategoryTagDto.md) | Tags associated with the category | [optional] [default to undefined]
**mediaItems** | [**Array&lt;MediaItemDto&gt;**](MediaItemDto.md) | List of media items associated with the category | [default to undefined]

## Example

```typescript
import { CategoryDto } from './api';

const instance: CategoryDto = {
    id,
    name,
    description,
    thumbnail,
    createdAt,
    updatedAt,
    tags,
    mediaItems,
};
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
