import {
    Body,
    Controller,
    Delete,
    Get,
    HttpCode,
    HttpStatus,
    InternalServerErrorException,
    Param,
    ParseIntPipe,
    Post,
} from '@nestjs/common';
import {
    ApiBadRequestResponse,
    ApiBody,
    ApiCreatedResponse,
    ApiOkResponse,
    ApiOperation,
    ApiTags,
} from '@nestjs/swagger';
import { CategoryTagService } from './category-tag.service';
import { CategoryTagDto } from './dto/category-tag.dto';
import { CreateCategoryTagDto } from './dto/create-category-tag.dto';

@ApiTags('Category Tags')
@Controller('category-tag')
export class CategoryTagController {
    constructor(private categoryTagService: CategoryTagService) {}

    @Get()
    @HttpCode(HttpStatus.OK)
    @ApiOperation({
        operationId: 'getCategoryTags',
        summary: 'Get all category tags',
    })
    @ApiOkResponse({
        description: 'The category tags have been successfully retrieved.',
        type: [CategoryTagDto],
    })
    @ApiBadRequestResponse({ description: 'Bad Request.' })
    async findAll() {
        try {
            const categoryTags = await this.categoryTagService.findAll();
            return categoryTags;
        } catch (e) {
            throw new InternalServerErrorException(e.message);
        }
    }

    @Post()
    @HttpCode(HttpStatus.CREATED)
    @ApiOperation({
        operationId: 'createCategoryTag',
        summary: 'Create a new category tag',
    })
    @ApiBody({
        description: 'The category tag to create.',
        type: CreateCategoryTagDto,
    })
    @ApiCreatedResponse({
        description: 'The category tag has been successfully created.',
        type: CategoryTagDto,
    })
    @ApiBadRequestResponse({ description: 'Bad Request.' })
    async create(@Body() createCategoryTagDto: CreateCategoryTagDto) {
        try {
            const categoryTag =
                await this.categoryTagService.create(createCategoryTagDto);
            return categoryTag;
        } catch (e) {
            throw new InternalServerErrorException(e.message);
        }
    }

    @Delete(':id')
    @HttpCode(HttpStatus.OK)
    @ApiOperation({
        operationId: 'deleteCategoryTag',
        summary: 'Delete a category tag',
    })
    @ApiOkResponse({
        description: 'The category tag has been successfully deleted.',
    })
    @ApiBadRequestResponse({ description: 'Bad Request.' })
    async delete(@Param('id', ParseIntPipe) id: number) {
        try {
            await this.categoryTagService.remove(id);
            return;
        } catch (e) {
            throw new InternalServerErrorException(e.message);
        }
    }
}
