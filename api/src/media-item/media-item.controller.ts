import {
    Body,
    ConflictException,
    Controller,
    Delete,
    Get,
    HttpCode,
    HttpStatus,
    InternalServerErrorException,
    NotFoundException,
    Param,
    ParseUUIDPipe,
    Patch,
    Post,
    UnsupportedMediaTypeException,
    UploadedFile,
    UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import {
    ApiBadRequestResponse,
    ApiBody,
    ApiConflictResponse,
    ApiConsumes,
    ApiCreatedResponse,
    ApiNotFoundResponse,
    ApiOkResponse,
    ApiOperation,
    ApiParam,
    ApiUnsupportedMediaTypeResponse,
} from '@nestjs/swagger';
import { AddOrRemoveSingleCategoryDto } from './dto/add-single-to-category.dto';
import { MediaItemDto } from './dto/media-item.dto';
import { MediaItemService } from './media-item.service';

@Controller('media-item')
export class MediaItemController {
    constructor(private readonly mediaService: MediaItemService) {}

    @Get('uncategorised')
    @ApiOperation({
        summary: 'Get all media items that are not in any categories.',
    })
    @ApiOkResponse({
        description: 'A list of media items.',
        type: [MediaItemDto],
    })
    uncategorisedMediaItems() {
        return this.mediaService.uncategorisedMediaItems();
    }

    @Get('recycled')
    @ApiOperation({ summary: 'Get all media items that are in the trash.' })
    @ApiOkResponse({
        description: 'A list of media items.',
        type: [MediaItemDto],
    })
    recycledMediaItems() {
        return this.mediaService.recycledMediaItems();
    }

    @Post('upload')
    @HttpCode(HttpStatus.CREATED)
    @UseInterceptors(FileInterceptor('file'))
    @ApiOperation({ summary: 'Upload a single media file' })
    @ApiConsumes('multipart/form-data')
    @ApiBody({
        description: 'The media file to upload and the optional category ID.',
        schema: {
            type: 'object',
            required: ['file'],
            properties: {
                file: {
                    type: 'string',
                    format: 'binary',
                },
                categoryID: {
                    type: 'string',
                    format: 'uuid',
                    description:
                        'Optional UUID of the category to add this media to.',
                    nullable: true,
                },
            },
        },
    })
    @ApiCreatedResponse({
        description: 'File uploaded successfully.',
        type: MediaItemDto,
    })
    @ApiConflictResponse({
        description: 'File is a duplicate of an existing item.',
    })
    @ApiUnsupportedMediaTypeResponse({ description: 'Unsupported file type.' })
    async uploadFile(
        @UploadedFile()
        file: Express.Multer.File,
        @Body('categoryID', new ParseUUIDPipe({ optional: true, version: '4' }))
        categoryID?: string,
    ) {
        const createResult = await this.mediaService.create({
            file,
            categoryID,
            deleteOnFail: true,
        });
        switch (createResult.result) {
            case 'success':
                return createResult.mediaItem;
            case 'duplicate':
                throw new ConflictException();
            case 'error':
                throw new InternalServerErrorException(createResult.message);
            case 'unsupported':
                throw new UnsupportedMediaTypeException();
        }
    }

    @Get(':id')
    @ApiOperation({ summary: 'Retrieve a media item by ID' })
    @ApiParam({
        name: 'id',
        required: true,
        description: 'The ID of the media item to retrieve',
    })
    @ApiOkResponse({
        description: 'The media item has been successfully retrieved.',
        type: MediaItemDto,
    })
    @ApiNotFoundResponse({ description: 'Media item not found.' })
    async getMediaItem(@Param('id') id: string) {
        const item = await this.mediaService.findOne(id);
        if (!item) throw new NotFoundException();
        return item;
    }

    @Delete(':id')
    @ApiOperation({ summary: 'Fully delete a media item.' })
    @ApiParam({
        name: 'id',
        type: 'string',
        format: 'uuid',
        description: 'The UUID of the media item.',
    })
    @ApiOkResponse({
        description: 'Item successfully deleted.',
    })
    @ApiNotFoundResponse({ description: 'Media item not found.' })
    deleteItem(@Param('id', ParseUUIDPipe) id: string) {
        return this.mediaService.remove(id);
    }

    @Post(':id/category')
    @HttpCode(HttpStatus.OK)
    @ApiOperation({ summary: 'Add a media item to a category.' })
    @ApiParam({
        name: 'id',
        type: 'string',
        format: 'uuid',
        description: 'The UUID of the media item.',
    })
    @ApiBody({
        description: 'The body containing the category ID.',
        type: AddOrRemoveSingleCategoryDto,
    })
    @ApiNotFoundResponse({
        description: 'If the media item or category were not found.',
    })
    @ApiBadRequestResponse({
        description: 'If the media item is already in the category.',
    })
    @ApiOkResponse({
        description: 'Item added to category successfully.',
        type: MediaItemDto,
    })
    addMediaItemToCategory(
        @Param('id', ParseUUIDPipe) id: string,
        @Body() body: AddOrRemoveSingleCategoryDto,
    ) {
        return this.mediaService.addToCategory(id, body.categoryID);
    }

    @Delete(':id/category')
    @ApiOperation({ summary: 'Remove a media item from a category.' })
    @ApiParam({
        name: 'id',
        type: 'string',
        format: 'uuid',
        description: 'The UUID of the media item.',
    })
    @ApiBody({
        description: 'The body containing the category ID.',
        type: AddOrRemoveSingleCategoryDto,
    })
    @ApiNotFoundResponse({
        description: 'If the media item or category were not found.',
    })
    @ApiBadRequestResponse({
        description: 'If the media item is not in the category.',
    })
    @ApiOkResponse({
        description: 'Item removed from category successfully.',
        type: MediaItemDto,
    })
    removeMediaItemFromCategory(
        @Param('id', ParseUUIDPipe) id: string,
        @Body() body: AddOrRemoveSingleCategoryDto,
    ) {
        return this.mediaService.removeFromCategory(id, body.categoryID);
    }

    @Patch(':id/recycle')
    @ApiOperation({
        summary: 'Move a media item to the recycle bin (soft delete)',
    })
    @ApiParam({
        name: 'id',
        type: 'string',
        format: 'uuid',
        description: 'The UUID of the media item.',
    })
    @ApiOkResponse({
        description: 'Item moved to recycle bin successfully.',
        type: MediaItemDto,
    })
    @ApiNotFoundResponse({ description: 'Media item not found.' })
    recycleMediaItem(@Param('id', ParseUUIDPipe) id: string) {
        return this.mediaService.recycle(id);
    }

    @Patch(':id/un-recycle')
    @ApiOperation({ summary: 'Restore a media item from the recycle bin' })
    @ApiParam({
        name: 'id',
        type: 'string',
        format: 'uuid',
        description: 'The UUID of the media item.',
    })
    @ApiOkResponse({
        description: 'Item restored from recycle bin successfully.',
        type: MediaItemDto,
    })
    @ApiNotFoundResponse({ description: 'Media item not found.' })
    unRecycleMediaItem(@Param('id', ParseUUIDPipe) id: string) {
        return this.mediaService.unRecycle(id);
    }
}
