import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';

abstract class ManagedUsersRepository {
  Future<Either<Failure, List<ManagedUserEntity>>> getUsers();

  Future<Either<Failure, ManagedUserEntity>> getUserById(String id);

  Future<Either<Failure, ManagedUserEntity>> createUser({
    required String name,
    required String surname,
    required String email,
  });

  Future<Either<Failure, ManagedUserEntity>> updateUser({
    required String id,
    required String name,
    required String surname,
    required String email,
  });

  Future<Either<Failure, void>> deleteUser(String id);
}
