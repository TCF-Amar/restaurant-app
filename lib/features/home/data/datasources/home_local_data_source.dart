import 'package:flutter/material.dart';
import 'package:project/features/home/data/models/menu_item_model.dart';
import 'package:project/features/home/data/models/user_profile_model.dart';

abstract class HomeLocalDataSource {
  Future<UserProfileModel> getUserProfile();
  List<MenuItemModel> getMenuItems();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<UserProfileModel> getUserProfile() async {
    return const UserProfileModel(name: 'Adan Balina');
  }

  @override
  List<MenuItemModel> getMenuItems() {
    return const [
      MenuItemModel(icon: Icons.credit_card, label: 'Payment', index: 0),
      MenuItemModel(icon: Icons.card_giftcard, label: 'Promos', index: 1),
      MenuItemModel(icon: Icons.notifications, label: 'Notification', index: 2),
      MenuItemModel(icon: Icons.help_outline, label: 'Help', index: 3),
      MenuItemModel(icon: Icons.info_outline, label: 'About Us', index: 4),
      MenuItemModel(icon: Icons.star_border, label: 'Rate Us', index: 5),
    ];
  }
}
