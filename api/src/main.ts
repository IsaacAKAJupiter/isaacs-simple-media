import { HttpStatus, ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
    const app = await NestFactory.create<NestExpressApplication>(AppModule);
    const configService = app.get(ConfigService);

    app.useStaticAssets(configService.getOrThrow('UPLOAD_DIRECTORY'), {
        prefix: '/static/',
    });

    const swaggerConfig = new DocumentBuilder()
        .setTitle("Isaac's Simple Media API")
        .setDescription('This is the swagger docs for the media API.')
        .setVersion('1.0')
        .addGlobalResponse(
            {
                status: HttpStatus.INTERNAL_SERVER_ERROR,
                description: 'Internal server error.',
            },
            {
                status: HttpStatus.SERVICE_UNAVAILABLE,
                description: 'Service unavailable.',
            },
            {
                status: HttpStatus.GATEWAY_TIMEOUT,
                description: 'Gateway timeout.',
            },
            {
                status: HttpStatus.BAD_GATEWAY,
                description: 'Bad gateway.',
            },
        )
        .build();
    const documentFactory = () =>
        SwaggerModule.createDocument(app, swaggerConfig, {
            operationIdFactory: (_controllerKey, methodKey) => methodKey,
        });
    SwaggerModule.setup('swagger', app, documentFactory, {
        jsonDocumentUrl: 'swagger.json',
    });

    app.useGlobalPipes(new ValidationPipe());

    await app.listen(configService.getOrThrow('PORT'), '0.0.0.0');
}
bootstrap();
