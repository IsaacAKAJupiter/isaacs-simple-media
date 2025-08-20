import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { randomUUID } from 'node:crypto';
import { Repository } from 'typeorm';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { Category } from './entities/category.entity';

@Injectable()
export class CategoryService {
    constructor(
        @InjectRepository(Category)
        private categoryRepository: Repository<Category>,
    ) {}

    async create(createCategoryDto: CreateCategoryDto) {
        const id = randomUUID();
        const category = this.categoryRepository.create({
            ...createCategoryDto,
            id,
        });
        await this.categoryRepository.save(category);
        return category;
    }

    findAll() {
        return this.categoryRepository.find({ relations: ['thumbnail'] });
    }

    findOne(id: string) {
        return this.categoryRepository.findOne({
            where: { id },
            relations: ['mediaItems', 'thumbnail'],
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
}
