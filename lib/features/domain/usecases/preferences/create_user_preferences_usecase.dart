import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/index.dart';

class CreateUserPreferencesUsecase
    extends BaseUsecase<void, UserPreferencesEntity> {
  final UserPreferencesRepository repository;
  CreateUserPreferencesUsecase({required this.repository});
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.createUserPreferences(params);
  }
}
