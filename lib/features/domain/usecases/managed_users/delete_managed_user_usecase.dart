import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/usecases/base_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/get_managed_user_by_id_usecase.dart';

class DeleteManagedUserUsecase extends BaseUsecase<void, ManagedUserIdParam> {
  DeleteManagedUserUsecase({required this.repository});

  final ManagedUsersRepository repository;

  @override
  Future<Either<Failure, void>> call(ManagedUserIdParam params) {
    return repository.deleteUser(params.id);
  }
}
