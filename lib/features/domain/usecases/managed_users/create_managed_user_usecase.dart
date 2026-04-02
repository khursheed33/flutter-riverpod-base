import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/usecases/base_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';

class CreateManagedUserParam extends Equatable {
  const CreateManagedUserParam({
    required this.name,
    required this.surname,
    required this.email,
  });

  final String name;
  final String surname;
  final String email;

  @override
  List<Object?> get props => [name, surname, email];
}

class CreateManagedUserUsecase extends BaseUsecase<ManagedUserEntity, CreateManagedUserParam> {
  CreateManagedUserUsecase({required this.repository});

  final ManagedUsersRepository repository;

  @override
  Future<Either<Failure, ManagedUserEntity>> call(CreateManagedUserParam params) {
    return repository.createUser(
      name: params.name,
      surname: params.surname,
      email: params.email,
    );
  }
}
