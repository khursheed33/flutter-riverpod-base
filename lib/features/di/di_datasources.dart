import 'package:flutter_riverpod_base/features/data/sources/local/managed_users/managed_users_local_datasource.dart';
import 'package:flutter_riverpod_base/features/data/sources/local/managed_users/managed_users_local_datasource_impl.dart';
import 'package:flutter_riverpod_base/features/data/sources/remote/preferences/user_preferences_remote_ds_impl.dart';
import 'package:flutter_riverpod_base/index.dart';

/// `DiDatasources` class responsible to register and inject all types of datasources and their implementations.
class DiDatasources {
  final GetIt locator;
  DiDatasources({required this.locator}) {
    locator.registerLazySingleton<SafeApiCall>(
      () => SafeApiCallImpl(isConnectedUsecase: locator.call()),
    );
    locator.registerLazySingleton<ConnectivityLocalDatasource>(
      () => ConnectivityLocalDatasourceImpl(connectivity: locator.call()),
    );
    locator.registerLazySingleton<UserPreferenceRemoteDatasource>(
      () => UserPreferencesRemoteDatasourceImpl(hiveBox: locator.call()),
    );

    locator.registerLazySingleton<AuthenticationRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(
        hiveBox: locator.call(),
        sharedPreferences: locator.call(),
      ),
    );
    locator.registerLazySingleton<ManagedUsersLocalDatasource>(
      () => ManagedUsersLocalDatasourceImpl(hiveBox: locator.call()),
    );
  }
}
