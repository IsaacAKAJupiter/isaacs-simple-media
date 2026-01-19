import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddMediaItemViews1768774647570 implements MigrationInterface {
    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(
            `ALTER TABLE "media_items" ADD "views" integer NOT NULL DEFAULT 0;`,
        );
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(
            `ALTER TABLE "media_items" DROP COLUMN "views"`,
        );
    }
}
