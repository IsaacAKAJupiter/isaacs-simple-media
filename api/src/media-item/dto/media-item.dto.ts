import { ApiProperty } from '@nestjs/swagger';

export class MediaItemDto {
    @ApiProperty({
        example: 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d',
        description: 'The unique identifier for the media item.',
    })
    id: string;

    @ApiProperty({
        example: 'file.jpg',
        description: 'The original filename of the media item.',
    })
    fileName: string;

    @ApiProperty({
        example: 'jpg',
        description: 'The file extension of the media item.',
    })
    extension: string;

    @ApiProperty({
        example: 123456,
        description: 'The size of the file in bytes.',
    })
    size: number;

    @ApiProperty({
        example:
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
        description: 'The SHA-256 content hash of the file.',
    })
    contentHash: string;

    @ApiProperty({
        example: 'image/jpeg',
        description: 'The MIME type of the file.',
    })
    mediaType: string;

    @ApiProperty({
        example: 'storage/thumbnails/79e3831d-541c-4fa6-b2e4-77503ef22f60.jpg',
        description: 'Path to a generated thumbnail for video files.',
        nullable: true,
    })
    thumbnailPath: string | null;

    @ApiProperty()
    createdAt: Date;

    @ApiProperty({
        description: 'If set, the item is considered in the trash.',
        nullable: true,
    })
    recycledAt: Date | null;
}
