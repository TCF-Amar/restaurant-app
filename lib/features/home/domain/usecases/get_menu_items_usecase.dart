import 'package:project/features/home/domain/entities/menu_item_entity.dart';
import 'package:project/features/home/domain/repositories/home_repository.dart';

class GetMenuItemsUseCase {
  final HomeRepository repository;

  const GetMenuItemsUseCase(this.repository);

  List<MenuItemEntity> call() => repository.getMenuItems();
}
