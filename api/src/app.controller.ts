import { Controller, Get } from '@nestjs/common';
import { ApiOkResponse } from '@nestjs/swagger';

@Controller()
export class AppController {
    constructor() {}

    @Get('health')
    @ApiOkResponse({ description: 'Application is running.' })
    health() {
        return '';
    }
}
