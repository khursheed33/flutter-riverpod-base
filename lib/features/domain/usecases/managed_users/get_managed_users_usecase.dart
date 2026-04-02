import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/params/no_params.dart';
import 'package:flutter_riverpod_base/core/usecases/base_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';

class GetManagedUsersUsecase extends BaseUsecase<List<ManagedUserEntity>, NoParams> {
  GetManagedUsersUsecase({required this.repository});

  final ManagedUsersRepository repository;

  @override
  Future<Either<Failure, List<ManagedUserEntity>>> call(NoParams params) {
    return repository.getUsers();
  }
}
