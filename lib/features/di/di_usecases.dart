import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/create_managed_user_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/delete_managed_user_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/get_managed_user_by_id_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/get_managed_users_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/managed_users/update_managed_user_usecase.dart';
import 'package:flutter_riverpod_base/index.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiUsecases {
  final GetIt locator;
  DiUsecases({required this.locator}) {
    // Safe API call Usecase
    locator.registerLazySingleton<SafeApiCallUsecase>(
      () => SafeApiCallUsecase(safeApiCall: locator.call()),
    );

    // Is Connected Usecase
    locator.registerLazySingleton<IsConnectedUsecase>(
      () => IsConnectedUsecase(repository: locator.call()),
    );

    // Sign In User Usecase
    locator.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(repository: locator.call()),
    );
    // Sign Out User Usecase
    locator.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(repository: locator.call()),
    );
    // Get User Usecase
    locator.registerLazySingleton<GetLocalUserUsecase>(
      () => GetLocalUserUsecase(repository: locator.call()),
    );
    // Create User Usecase
    locator.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(repository: locator.call()),
    );
    // Get User Usecase
    locator.registerLazySingleton<GetUserUsecase>(
      () => GetUserUsecase(repository: locator.call()),
    );
    // Get Token Usecase
    locator.registerLazySingleton<CreateUserPreferencesUsecase>(
      () => CreateUserPreferencesUsecase(repository: locator.call()),
    );
    // Get Token Usecase
    locator.registerLazySingleton<UpdateUserPreferencesUsecase>(
      () => UpdateUserPreferencesUsecase(repository: locator.call()),
    );
    // Get Token Usecase
    locator.registerLazySingleton<GetUserPreferencesUsecase>(
      () => GetUserPreferencesUsecase(repository: locator.call()),
    );
    locator.registerLazySingleton<GetUserPreferencesStreamUsecase>(
      () => GetUserPreferencesStreamUsecase(repository: locator.call()),
    );

    locator.registerLazySingleton<GetManagedUsersUsecase>(
      () => GetManagedUsersUsecase(repository: locator.call<ManagedUsersRepository>()),
    );
    locator.registerLazySingleton<GetManagedUserByIdUsecase>(
      () => GetManagedUserByIdUsecase(repository: locator.call<ManagedUsersRepository>()),
    );
    locator.registerLazySingleton<CreateManagedUserUsecase>(
      () => CreateManagedUserUsecase(repository: locator.call<ManagedUsersRepository>()),
    );
    locator.registerLazySingleton<UpdateManagedUserUsecase>(
      () => UpdateManagedUserUsecase(repository: locator.call<ManagedUsersRepository>()),
    );
    locator.registerLazySingleton<DeleteManagedUserUsecase>(
      () => DeleteManagedUserUsecase(repository: locator.call<ManagedUsersRepository>()),
    );
  }
}
