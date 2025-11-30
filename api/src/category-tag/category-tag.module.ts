import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CategoryTagController } from './category-tag.controller';
import { CategoryTagService } from './category-tag.service';
import { CategoryTag } from './entities/category-tag.entity';

@Module({
    imports: [TypeOrmModule.forFeature([CategoryTag])],
    providers: [CategoryTagService],
    controllers: [CategoryTagController],
})
export class CategoryTagModule {}
