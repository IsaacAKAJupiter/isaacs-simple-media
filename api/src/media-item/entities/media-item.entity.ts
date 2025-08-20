import { Category } from 'src/category/entities/category.entity';
import {
    Column,
    CreateDateColumn,
    Entity,
    Index,
    ManyToMany,
    PrimaryColumn,
} from 'typeorm';

@Entity('media_items')
export class MediaItem {
    @PrimaryColumn('uuid')
    id: string;

    @Column({ name: 'file_name' })
    @Index()
    fileName: string;

    @Column({ name: 'content_hash' })
    @Index()
    contentHash: string;

    @Column({ name: 'media_type' })
    @Index()
    mediaType: string;

    @Column()
    @Index()
    extension: string;

    @Column({ type: 'integer' })
    @Index()
    size: number;

    @Column({ name: 'thumbnail_path', type: 'varchar', nullable: true })
    thumbnailPath: string | null;

    @CreateDateColumn({ name: 'created_at' })
    createdAt: Date;

    @Column({ name: 'recycled_at', type: 'datetime', nullable: true })
    @Index()
    recycledAt: Date | null;

    @ManyToMany(() => Category, (category) => category.mediaItems)
    categories: Category[];
}
