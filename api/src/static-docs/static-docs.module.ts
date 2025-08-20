import { Module } from '@nestjs/common';
import { StaticDocsController } from './static-docs.controller';

@Module({ controllers: [StaticDocsController] })
export class StaticDocsModule {}
