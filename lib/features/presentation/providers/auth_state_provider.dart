import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_base/features/di/di_container.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/auth_view_model.dart';

/// Authentication feature state. Owned by Riverpod (disposed with [ProviderScope]).
///
/// To remove this feature: delete this file, [AuthViewModel], and drop usages / routes.
final authViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel(
    updateUserPreferencesUsecase: locator(),
    getUserPreferencesUsecase: locator(),
    createUserPreferencesUsecase: locator(),
  );
}, name: 'authViewModel');
