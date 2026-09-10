import 'package:project/features/home/domain/entities/menu_item_entity.dart';
import 'package:project/features/home/domain/entities/user_profile_entity.dart';

abstract class HomeRepository {
  Future<UserProfileEntity> getUserProfile();
  List<MenuItemEntity> getMenuItems();
}
