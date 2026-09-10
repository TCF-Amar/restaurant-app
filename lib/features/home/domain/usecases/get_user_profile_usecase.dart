import 'package:project/features/home/domain/entities/user_profile_entity.dart';
import 'package:project/features/home/domain/repositories/home_repository.dart';

class GetUserProfileUseCase {
  final HomeRepository repository;

  const GetUserProfileUseCase(this.repository);

  Future<UserProfileEntity> call() => repository.getUserProfile();
}
