import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddCategoryTags1623456789012 implements MigrationInterface {
    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
      CREATE TABLE "category_tags" (
        "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" varchar(100) NOT NULL,
        "colour" varchar(7) NOT NULL
      )
    `);

        await queryRunner.query(`
      CREATE TABLE "category_tags_categories" (
        "category_id" varchar NOT NULL,
        "category_tag_id" integer NOT NULL,
        PRIMARY KEY ("category_id", "category_tag_id"),
        FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
        FOREIGN KEY ("category_tag_id") REFERENCES "category_tags" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
      )
    `);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "category_tags_categories"`);
        await queryRunner.query(`DROP TABLE "category_tags"`);
    }
}
