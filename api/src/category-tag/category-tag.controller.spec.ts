import { Test, TestingModule } from '@nestjs/testing';
import { CategoryTagController } from './category-tag.controller';

describe('CategoryTagController', () => {
  let controller: CategoryTagController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CategoryTagController],
    }).compile();

    controller = module.get<CategoryTagController>(CategoryTagController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
