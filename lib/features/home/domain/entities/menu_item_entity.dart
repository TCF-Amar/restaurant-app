import 'package:flutter/material.dart';

class MenuItemEntity {
  final IconData icon;
  final String label;
  final int index;

  const MenuItemEntity({
    required this.icon,
    required this.label,
    required this.index,
  });
}
