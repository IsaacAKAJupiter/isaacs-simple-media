import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { randomUUID } from 'node:crypto';
import { In, Repository } from 'typeorm';
import { CategoryTag } from '../category-tag/entities/category-tag.entity';
import { AddCategoryTagDto } from './dto/add-category-tag.dto';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { Category } from './entities/category.entity';

@Injectable()
export class CategoryService {
    constructor(
        @InjectRepository(Category)
        private categoryRepository: Repository<Category>,
        @InjectRepository(CategoryTag)
        private categoryTagRepository: Repository<CategoryTag>,
    ) {}

    async create(createCategoryDto: CreateCategoryDto) {
        const id = randomUUID();
        const { tags, ...categoryData } = createCategoryDto;
        const category = this.categoryRepository.create({
            ...categoryData,
            id,
        });
        await this.categoryRepository.save(category);

        if (tags && tags.length > 0) {
            const tagEntities = await this.categoryTagRepository.findBy({
                id: In(tags),
            });
            category.tags = tagEntities;
            await this.categoryRepository.save(category);
        }
        return category;
    }

    findAll() {
        return this.categoryRepository.find({
            relations: ['thumbnail', 'tags', 'mediaItems'],
        });
    }

    findOne(id: string) {
        return this.categoryRepository.findOne({
            where: { id },
            relations: ['mediaItems', 'thumbnail', 'tags'],
        });
    }

    async update(id: string, updateCategoryDto: UpdateCategoryDto) {
        const category = await this.categoryRepository.findOneBy({ id });
        if (!category) return null;

        const newCategory = { ...category, ...updateCategoryDto };
        await this.categoryRepository.save(newCategory);
        return newCategory;
    }

    async remove(id: string) {
        const category = await this.categoryRepository.findOneBy({ id });
        if (!category) return null;

        return await this.categoryRepository.remove(category);
    }

    async addTag(id: string, addCategoryTagDto: AddCategoryTagDto) {
        const category = await this.findOne(id);
        if (!category) return null;

        const tag = await this.categoryTagRepository.findOneBy({
            id: addCategoryTagDto.tagID,
        });
        if (!tag) return null;

        category.tags.push(tag);
        await this.categoryRepository.save(category);
        return category;
    }

    async removeTag(id: string, tagID: number) {
        const category = await this.findOne(id);
        if (!category) return null;

        const tag = await this.categoryTagRepository.findOneBy({
            id: tagID,
        });
        if (!tag) return null;

        category.tags = (category.tags ?? []).filter((tag) => tag.id !== tagID);
        await this.categoryRepository.save(category);
        return category;
    }
}
