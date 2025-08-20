import { MigrationInterface, QueryRunner } from 'typeorm';

export class InitialMigration1754958018018 implements MigrationInterface {
    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            CREATE TABLE "media_items" (
                "id" varchar PRIMARY KEY NOT NULL,
                "file_name" varchar NOT NULL,
                "extension" varchar NOT NULL,
                "size" integer NOT NULL,
                "content_hash" varchar NOT NULL,
                "media_type" varchar NOT NULL,
                "thumbnail_path" varchar,
                "created_at" datetime NOT NULL DEFAULT (datetime('now')),
                "recycled_at" datetime
            )
        `);

        await queryRunner.query(`
            CREATE TABLE "categories" (
                "id" varchar PRIMARY KEY NOT NULL,
                "name" varchar NOT NULL,
                "description" text,
                "created_at" datetime NOT NULL DEFAULT (datetime('now')),
                "updated_at" datetime NOT NULL DEFAULT (datetime('now')),
                "thumbnail_media_id" varchar,
                CONSTRAINT "FK_thumbnail_media" FOREIGN KEY ("thumbnail_media_id") REFERENCES "media_items" ("id") ON DELETE SET NULL ON UPDATE NO ACTION
            )
        `);

        await queryRunner.query(`
            CREATE TABLE "category_media_items" (
                "category_id" varchar NOT NULL,
                "media_item_id" varchar NOT NULL,
                PRIMARY KEY ("category_id", "media_item_id"),
                FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
                FOREIGN KEY ("media_item_id") REFERENCES "media_items" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
            )
        `);

        await queryRunner.query(`
            CREATE INDEX "IDX_category_media_items_category_id" ON "category_media_items" ("category_id")
        `);
        await queryRunner.query(`
            CREATE INDEX "IDX_category_media_items_media_item_id" ON "category_media_items" ("media_item_id")
        `);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            DROP INDEX "IDX_category_media_items_media_item_id"
        `);
        await queryRunner.query(`
            DROP INDEX "IDX_category_media_items_category_id"
        `);
        await queryRunner.query(`
            DROP TABLE "category_media_items"
        `);
        await queryRunner.query(`
            DROP TABLE "categories"
        `);
        await queryRunner.query(`
            DROP TABLE "media_items"
        `);
    }
}
