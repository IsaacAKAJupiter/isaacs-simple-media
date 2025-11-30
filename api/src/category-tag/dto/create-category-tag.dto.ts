import { ApiProperty } from '@nestjs/swagger';
import { IsString } from 'class-validator';

export class CreateCategoryTagDto {
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
