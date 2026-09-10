class UserProfileEntity {
  final String name;
  final String avatarUrl;

  const UserProfileEntity({
    required this.name,
    this.avatarUrl = '',
  });
}
