import 'package:flutter_riverpod_base/features/data/repositories/managed_users_repository_impl.dart';
import 'package:flutter_riverpod_base/features/data/repositories/user_preferences_repo_impl.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/managed_users_repository.dart';
import 'package:flutter_riverpod_base/index.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiRepositories {
  final GetIt locator;
  DiRepositories({required this.locator}) {
    locator.registerFactory<ConnectivityRepository>(
      () => ConnectivityRepositoryImpl(datasource: locator.call()),
    );
    locator.registerFactory<AuthenticationRepository>(
      () => AuthRepositoryImpl(
        datasource: locator.call(),
        safeApiCall: locator.call(),
      ),
    );
    locator.registerFactory<UserPreferencesRepository>(
      () => UserPreferencesRepositoryImpl(
        datasource: locator.call(),
        safeApiCall: locator.call(),
      ),
    );
    locator.registerFactory<ManagedUsersRepository>(
      () => ManagedUsersRepositoryImpl(datasource: locator.call()),
    );
  }
}
