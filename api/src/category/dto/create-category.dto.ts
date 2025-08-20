import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString } from 'class-validator';

export class CreateCategoryDto {
    @ApiProperty({
        type: String,
        description: 'The name of the category.',
        example: 'My Category',
    })
    @IsString()
    name: string;

    @ApiPropertyOptional({
        type: String,
        description: 'The description of the category.',
        example: 'My category description.',
    })
    @IsOptional()
    @IsString()
    readonly description: string;

    @ApiPropertyOptional({
        type: String,
        description: 'The media item ID to use for the category.',
        example: '7e25023a-d95e-41ab-8c43-9c0da0f11f06',
    })
    @IsOptional()
    @IsString()
    readonly thumbnailMediaID: string;
}
