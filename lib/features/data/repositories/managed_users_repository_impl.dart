import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/features/data/models/managed_user/managed_user_model.dart';
import 'package:flutter_riverpod_base/features/data/sources/local/managed_users/managed_users_local_datasource.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';

class ManagedUsersRepositoryImpl implements ManagedUsersRepository {
  ManagedUsersRepositoryImpl({required ManagedUsersLocalDatasource datasource})
      : _ds = datasource;

  final ManagedUsersLocalDatasource _ds;

  Future<List<ManagedUserEntity>> _loadEntities() async {
    final rows = await _ds.readAll();
    return rows.map(ManagedUserModel.fromJson).map((m) => m.toEntity()).toList();
  }

  Future<void> _saveEntities(List<ManagedUserEntity> users) async {
    final rows = users.map((e) => ManagedUserModel.fromEntity(e).toJson()).toList();
    await _ds.writeAll(rows);
  }

  @override
  Future<Either<Failure, List<ManagedUserEntity>>> getUsers() async {
    try {
      final list = await _loadEntities();
      list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return Right(list);
    } catch (e) {
      return Left(Failure('Failed to load users: $e'));
    }
  }

  @override
  Future<Either<Failure, ManagedUserEntity>> getUserById(String id) async {
    try {
      final list = await _loadEntities();
      for (final u in list) {
        if (u.id == id) return Right(u);
      }
      return Left(Failure('User not found'));
    } catch (e) {
      return Left(Failure('Failed to read user: $e'));
    }
  }

  @override
  Future<Either<Failure, ManagedUserEntity>> createUser({
    required String name,
    required String surname,
    required String email,
  }) async {
    try {
      final list = await _loadEntities();
      final now = DateTime.now().toUtc();
      final id = 'mu_${now.microsecondsSinceEpoch}';
      final entity = ManagedUserEntity(
        id: id,
        name: name.trim(),
        surname: surname.trim(),
        email: email.trim(),
        updatedAt: now,
      );
      list.add(entity);
      await _saveEntities(list);
      return Right(entity);
    } catch (e) {
      return Left(Failure('Failed to create user: $e'));
    }
  }

  @override
  Future<Either<Failure, ManagedUserEntity>> updateUser({
    required String id,
    required String name,
    required String surname,
    required String email,
  }) async {
    try {
      final list = await _loadEntities();
      final index = list.indexWhere((u) => u.id == id);
      if (index < 0) return Left(Failure('User not found'));
      final updated = ManagedUserEntity(
        id: id,
        name: name.trim(),
        surname: surname.trim(),
        email: email.trim(),
        updatedAt: DateTime.now().toUtc(),
      );
      list[index] = updated;
      await _saveEntities(list);
      return Right(updated);
    } catch (e) {
      return Left(Failure('Failed to update user: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(String id) async {
    try {
      final list = await _loadEntities();
      final next = list.where((u) => u.id != id).toList();
      if (next.length == list.length) return Left(Failure('User not found'));
      await _saveEntities(next);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to delete user: $e'));
    }
  }
}
