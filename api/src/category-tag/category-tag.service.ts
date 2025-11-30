import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCategoryTagDto } from './dto/create-category-tag.dto';
import { UpdateCategoryTagDto } from './dto/update-category-tag.dto';
import { CategoryTag } from './entities/category-tag.entity';

@Injectable()
export class CategoryTagService {
    constructor(
        @InjectRepository(CategoryTag)
        private categoryTagRepository: Repository<CategoryTag>,
    ) {}

    findAll() {
        return this.categoryTagRepository.find();
    }

    findOne(id: number) {
        return this.categoryTagRepository.findOneBy({ id });
    }

    async create(createCategoryTagDto: CreateCategoryTagDto) {
        const tag = this.categoryTagRepository.create(createCategoryTagDto);
        await this.categoryTagRepository.save(tag);
        return tag;
    }

    async update(id: number, updateCategoryTagDto: UpdateCategoryTagDto) {
        const tag = await this.categoryTagRepository.findOneBy({ id });
        if (!tag) return null;

        const newTag = { ...tag, ...updateCategoryTagDto };
        await this.categoryTagRepository.save(newTag);
        return newTag;
    }

    async remove(id: number) {
        const tag = await this.categoryTagRepository.findOneBy({ id });
        if (!tag) return null;

        return await this.categoryTagRepository.remove(tag);
    }
}
