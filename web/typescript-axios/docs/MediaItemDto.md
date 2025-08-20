# MediaItemDto


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **string** | The unique identifier for the media item. | [default to undefined]
**fileName** | **string** | The original filename of the media item. | [default to undefined]
**extension** | **string** | The file extension of the media item. | [default to undefined]
**size** | **number** | The size of the file in bytes. | [default to undefined]
**contentHash** | **string** | The SHA-256 content hash of the file. | [default to undefined]
**mediaType** | **string** | The MIME type of the file. | [default to undefined]
**thumbnailPath** | **object** | Path to a generated thumbnail for video files. | [default to undefined]
**createdAt** | **string** |  | [default to undefined]
**recycledAt** | **object** | If set, the item is considered in the trash. | [default to undefined]

## Example

```typescript
import { MediaItemDto } from './api';

const instance: MediaItemDto = {
    id,
    fileName,
    extension,
    size,
    contentHash,
    mediaType,
    thumbnailPath,
    createdAt,
    recycledAt,
};
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
