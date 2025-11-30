import { ApiProperty } from '@nestjs/swagger';
import { IsInt, IsString } from 'class-validator';

export class CategoryTagDto {
    @ApiProperty({
        description: 'ID of the tag',
        example: '1',
    })
    @IsInt()
    id: number;

    @ApiProperty({
        description: 'Name of the tag',
        example: 'People',
    })
    @IsString()
    name: string;

    @ApiProperty({
        description: 'Colour of the tag as hex code',
        example: '#1E90FF',
    })
    @IsString()
    colour: string;
}
