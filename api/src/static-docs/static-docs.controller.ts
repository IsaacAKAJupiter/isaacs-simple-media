import { Controller, Get } from '@nestjs/common';
import { ApiOperation, ApiParam, ApiResponse, ApiTags } from '@nestjs/swagger';

@ApiTags('Static Assets')
@Controller()
export class StaticDocsController {
    @Get('/static/thumbnails/:id.png')
    @ApiOperation({
        summary:
            'Retrieve a static thumbnail for a media item. Only for video files.',
        description:
            'The actual serving is handled by middleware, this is for documentation purposes only.',
    })
    @ApiParam({
        name: 'id',
        type: 'string',
        description: 'The ID of the media item.',
    })
    @ApiResponse({
        status: 200,
        description: 'The requested file.',
        content: {
            'image/png': {
                schema: {
                    type: 'string',
                    format: 'binary',
                },
            },
        },
    })
    @ApiResponse({ status: 404, description: 'File not found.' })
    getStaticThumbnail() {}

    @Get('/static/hls/:id/stream.m3u8')
    @ApiOperation({
        summary:
            'Retrieve a static HLS stream for a media item. Only for video files.',
        description:
            'The actual serving is handled by middleware, this is for documentation purposes only.',
    })
    @ApiParam({
        name: 'id',
        type: 'string',
        description: 'The ID of the media item.',
    })
    @ApiResponse({
        status: 200,
        description: 'The requested file.',
        content: {
            'application/vnd.apple.mpegurl': {
                schema: {
                    type: 'string',
                    format: 'binary',
                },
            },
        },
    })
    @ApiResponse({ status: 404, description: 'File not found.' })
    getStaticHLS() {}

    @Get('/static/:path')
    @ApiOperation({
        summary:
            'Retrieve a static media file. Contains the raw media for the uploaded media items.',
        description:
            'The actual serving is handled by middleware, this is for documentation purposes only.',
    })
    @ApiParam({
        name: 'path',
        type: 'string',
        description:
            'The path to the file in the following format: "{id}.{extension}".',
    })
    @ApiResponse({
        status: 200,
        description: 'The requested file.',
        content: {
            'application/octet-stream': {
                schema: {
                    type: 'string',
                    format: 'binary',
                },
            },
        },
    })
    @ApiResponse({ status: 404, description: 'File not found.' })
    getStaticAsset() {}
}
