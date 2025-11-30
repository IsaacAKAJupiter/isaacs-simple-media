import { PartialType } from '@nestjs/mapped-types';
import { CreateCategoryTagDto } from './create-category-tag.dto';

export class UpdateCategoryTagDto extends PartialType(CreateCategoryTagDto) {}
