import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/params/no_params.dart';
import 'package:flutter_riverpod_base/features/di/di_container.dart';
import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/create_managed_user_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/delete_managed_user_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/get_managed_user_by_id_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/get_managed_users_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/update_managed_user_usecase.dart';

final managedUsersNotifierProvider =
    AsyncNotifierProvider<ManagedUsersNotifier, List<ManagedUserEntity>>(
  ManagedUsersNotifier.new,
);

class ManagedUsersNotifier extends AsyncNotifier<List<ManagedUserEntity>> {
  GetManagedUsersUsecase get _list => locator<GetManagedUsersUsecase>();

  @override
  Future<List<ManagedUserEntity>> build() async {
    final res = await _list.call(const NoParams());
    return res.fold((f) => throw Exception(f.message), (r) => r);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final res = await _list.call(const NoParams());
      return res.fold((f) => throw Exception(f.message), (r) => r);
    });
  }

  Future<String?> create({
    required String name,
    required String surname,
    required String email,
  }) async {
    final res = await locator<CreateManagedUserUsecase>().call(
      CreateManagedUserParam(name: name, surname: surname, email: email),
    );
    return res.fold(
      (f) => f.message,
      (entity) {
        state = AsyncData([entity, ...(state.valueOrNull ?? [])]);
        return null;
      },
    );
  }

  Future<String?> saveChanges({
    required String id,
    required String name,
    required String surname,
    required String email,
  }) async {
    final res = await locator<UpdateManagedUserUsecase>().call(
      UpdateManagedUserParam(id: id, name: name, surname: surname, email: email),
    );
    return res.fold(
      (f) => f.message,
      (entity) {
        final list = state.valueOrNull ?? [];
        state = AsyncData(
          list.map((u) => u.id == entity.id ? entity : u).toList(),
        );
        return null;
      },
    );
  }

  Future<String?> delete(String id) async {
    final res = await locator<DeleteManagedUserUsecase>().call(ManagedUserIdParam(id));
    return res.fold(
      (f) => f.message,
      (_) {
        final list = state.valueOrNull ?? [];
        state = AsyncData(list.where((u) => u.id != id).toList());
        return null;
      },
    );
  }
}

final managedUserDetailProvider =
    FutureProvider.family<ManagedUserEntity?, String>((ref, id) async {
  final res = await locator<GetManagedUserByIdUsecase>().call(ManagedUserIdParam(id));
  return res.fold((_) => null, (r) => r);
});
