import { PartialType } from '@nestjs/swagger';
import { CategoryDto } from './category.dto';

export class PatchCategoryDto extends PartialType(CategoryDto) {}
