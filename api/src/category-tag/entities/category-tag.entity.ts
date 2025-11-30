import { Column, Entity, ManyToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Category } from '../../category/entities/category.entity';

@Entity('category_tags')
export class CategoryTag {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 100 })
    name: string;

    // Store colour as hex string, e.g., "#FF5733"
    @Column({ type: 'varchar', length: 7 })
    colour: string;
    @ManyToMany(() => Category, (category) => category.tags)
    categories: Category[];
}
