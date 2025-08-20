import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString, IsUUID } from 'class-validator';
import { MediaItemDto } from 'src/media-item/dto/media-item.dto';

export class CategoryDto {
    @ApiProperty({
        description: 'Unique identifier for the category',
        type: String,
    })
    @IsUUID()
    id: string;

    @ApiProperty({ description: 'Name of the category' })
    @IsString()
    name: string;

    @ApiProperty({ description: 'Description of the category', nullable: true })
    @IsOptional()
    @IsString()
    description: string | null;

    @ApiProperty({
        description: 'Thumbnail media item',
        type: MediaItemDto,
        nullable: true,
    })
    @IsOptional()
    thumbnail: MediaItemDto | null;

    @ApiProperty({ description: 'Creation date of the category' })
    createdAt: Date;

    @ApiProperty({ description: 'Last update date of the category' })
    updatedAt: Date;

    @ApiProperty({
        description: 'List of media items associated with the category',
        type: [MediaItemDto],
        nullable: true,
    })
    @IsOptional()
    mediaItems: MediaItemDto[] | null;
}
