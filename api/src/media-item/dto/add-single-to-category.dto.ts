import { ApiProperty } from '@nestjs/swagger';

export class AddOrRemoveSingleCategoryDto {
    @ApiProperty({
        example: 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d',
        description: 'The unique identifier for the category.',
    })
    categoryID: string;
}
