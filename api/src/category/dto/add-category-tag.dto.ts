import { ApiProperty } from '@nestjs/swagger';

export class AddCategoryTagDto {
    @ApiProperty({
        example: '1',
        description: 'The unique identifier for the category tag.',
    })
    tagID: number;
}
