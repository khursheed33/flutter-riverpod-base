import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/usecases/base_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';

class UpdateManagedUserParam extends Equatable {
  const UpdateManagedUserParam({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  final String id;
  final String name;
  final String surname;
  final String email;

  @override
  List<Object?> get props => [id, name, surname, email];
}

class UpdateManagedUserUsecase extends BaseUsecase<ManagedUserEntity, UpdateManagedUserParam> {
  UpdateManagedUserUsecase({required this.repository});

  final ManagedUsersRepository repository;

  @override
  Future<Either<Failure, ManagedUserEntity>> call(UpdateManagedUserParam params) {
    return repository.updateUser(
      id: params.id,
      name: params.name,
      surname: params.surname,
      email: params.email,
    );
  }
}
