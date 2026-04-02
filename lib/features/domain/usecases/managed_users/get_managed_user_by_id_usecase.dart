import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/usecases/base_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';

class ManagedUserIdParam extends Equatable {
  const ManagedUserIdParam(this.id);
  final String id;
  @override
  List<Object?> get props => [id];
}

class GetManagedUserByIdUsecase extends BaseUsecase<ManagedUserEntity, ManagedUserIdParam> {
  GetManagedUserByIdUsecase({required this.repository});

  final ManagedUsersRepository repository;

  @override
  Future<Either<Failure, ManagedUserEntity>> call(ManagedUserIdParam params) {
    return repository.getUserById(params.id);
  }
}
