import {
    BadRequestException,
    Body,
    Controller,
    Delete,
    Get,
    HttpCode,
    HttpStatus,
    InternalServerErrorException,
    NotFoundException,
    Param,
    Patch,
    Post,
} from '@nestjs/common';
import {
    ApiBadRequestResponse,
    ApiBody,
    ApiCreatedResponse,
    ApiNotFoundResponse,
    ApiOkResponse,
    ApiOperation,
    ApiParam,
    ApiTags,
} from '@nestjs/swagger';
import { CategoryService } from './category.service';
import { CategoryDto } from './dto/category.dto';
import { CreateCategoryDto } from './dto/create-category.dto';
import { PatchCategoryDto } from './dto/patch-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';

@ApiTags('Categories')
@Controller('category')
export class CategoryController {
    constructor(private readonly categoryService: CategoryService) {}

    @Post()
    @HttpCode(HttpStatus.CREATED)
    @ApiOperation({ summary: 'Create a new category' })
    @ApiBody({
        description: 'The media file to upload.',
        type: CreateCategoryDto,
    })
    @ApiCreatedResponse({
        description: 'The category has been successfully created.',
        type: CategoryDto,
    })
    @ApiBadRequestResponse({ description: 'Bad Request.' })
    async create(@Body() createCategoryDto: CreateCategoryDto) {
        try {
            const category =
                await this.categoryService.create(createCategoryDto);
            return category;
        } catch (e) {
            throw new InternalServerErrorException(e.message);
        }
    }

    @Get()
    @ApiOperation({ summary: 'Retrieve all categories' })
    @ApiOkResponse({ description: 'List of categories.', type: [CategoryDto] })
    findAll() {
        return this.categoryService.findAll();
    }

    @Get(':id')
    @ApiOperation({ summary: 'Retrieve a category by ID' })
    @ApiParam({
        name: 'id',
        required: true,
        description: 'The ID of the category to retrieve',
    })
    @ApiOkResponse({
        description: 'The category has been successfully retrieved.',
        type: CategoryDto,
    })
    @ApiNotFoundResponse({ description: 'Category not found.' })
    async findOne(@Param('id') id: string) {
        const category = await this.categoryService.findOne(id);
        if (!category) throw new NotFoundException();
        return category;
    }

    @Patch(':id')
    @ApiOperation({ summary: 'Update a category by ID' })
    @ApiParam({
        name: 'id',
        required: true,
        description: 'The ID of the category to update',
    })
    @ApiBody({
        description: 'Partial category body.',
        type: PatchCategoryDto,
    })
    @ApiOkResponse({
        description: 'The category has been successfully updated.',
        type: CategoryDto,
    })
    @ApiNotFoundResponse({ description: 'Category not found.' })
    @ApiBadRequestResponse({ description: 'Bad Request.' })
    async update(
        @Param('id') id: string,
        @Body() updateCategoryDto: UpdateCategoryDto,
    ) {
        try {
            const updatedCategory = await this.categoryService.update(
                id,
                updateCategoryDto,
            );
            return updatedCategory;
        } catch (error) {
            if (error.message === 'Category not found.') {
                throw new NotFoundException();
            }

            throw new BadRequestException(error.message);
        }
    }

    @Delete(':id')
    @ApiOperation({ summary: 'Delete a category by ID' })
    @ApiParam({
        name: 'id',
        required: true,
        description: 'The ID of the category to delete',
    })
    @ApiOkResponse({
        description: 'The category has been successfully deleted.',
    })
    @ApiNotFoundResponse({ description: 'Category not found.' })
    async remove(@Param('id') id: string) {
        const result = await this.categoryService.remove(id);
        if (!result) throw new NotFoundException();

        return { message: 'Category deleted successfully.' };
    }
}
