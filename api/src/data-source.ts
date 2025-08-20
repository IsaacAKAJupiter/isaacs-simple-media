import path from 'node:path';
import { DataSource, DataSourceOptions } from 'typeorm';

export const dataSourceOptions: DataSourceOptions = {
    type: 'better-sqlite3',
    database: 'ism.db',
    entities: [path.join(__dirname, '**', '*.entity.{ts,js}')],
    migrations: [path.join(__dirname, 'migrations', '*.{ts,js}')],
    migrationsRun: true,
    synchronize: false,
};

const dataSource = new DataSource(dataSourceOptions);
export default dataSource;
