import { MediaItem } from 'src/media-item/entities/media-item.entity';
import {
    Column,
    CreateDateColumn,
    Entity,
    Index,
    JoinColumn,
    JoinTable,
    ManyToMany,
    OneToOne,
    PrimaryColumn,
    UpdateDateColumn,
} from 'typeorm';
import { CategoryTag } from '../../category-tag/entities/category-tag.entity';

@Entity('categories')
export class Category {
    @PrimaryColumn('uuid')
    id: string;

    @Column()
    @Index()
    name: string;

    @Column({ type: 'text', nullable: true })
    description: string | null;

    @OneToOne(() => MediaItem, {
        nullable: true,
        onDelete: 'SET NULL',
    })
    @JoinColumn({ name: 'thumbnail_media_id' })
    thumbnail: MediaItem;

    @CreateDateColumn({ name: 'created_at' })
    @Index()
    createdAt: Date;

    @UpdateDateColumn({ name: 'updated_at' })
    @Index()
    updatedAt: Date;

    @ManyToMany(() => MediaItem, (mediaItem) => mediaItem.categories)
    @JoinTable({
        name: 'category_media_items',
        joinColumn: { name: 'category_id', referencedColumnName: 'id' },
        inverseJoinColumn: {
            name: 'media_item_id',
            referencedColumnName: 'id',
        },
    })
    mediaItems: MediaItem[];

    @ManyToMany(() => CategoryTag, (tag) => tag.categories)
    @JoinTable({
        name: 'category_tags_categories',
        joinColumn: { name: 'category_id', referencedColumnName: 'id' },
        inverseJoinColumn: {
            name: 'category_tag_id',
            referencedColumnName: 'id',
        },
    })
    tags: CategoryTag[];
}
