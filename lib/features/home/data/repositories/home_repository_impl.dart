import 'package:project/features/home/data/datasources/home_local_data_source.dart';
import 'package:project/features/home/domain/entities/menu_item_entity.dart';
import 'package:project/features/home/domain/entities/user_profile_entity.dart';
import 'package:project/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<UserProfileEntity> getUserProfile() {
    return localDataSource.getUserProfile();
  }

  @override
  List<MenuItemEntity> getMenuItems() {
    return localDataSource.getMenuItems();
  }
}
