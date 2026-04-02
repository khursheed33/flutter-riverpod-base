import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_base/features/di/di_container.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_view_model.dart';

/// Global preferences / theme bootstrap. Owned by Riverpod (disposed with [ProviderScope]).
///
/// [AppPreferencesViewModel.init] runs once when the notifier is first read.
///
/// To remove this feature: delete this file, adjust [AppFoundation], and remove imports.
final appPreferencesViewModelProvider =
    ChangeNotifierProvider<AppPreferencesViewModel>((ref) {
  final vm = AppPreferencesViewModel(
    getUserPreferencesUsecase: locator(),
    createUserPreferencesUsecase: locator(),
    updateUserPreferencesUsecase: locator(),
    getUserPreferencesStreamUsecase: locator(),
  );
  vm.init();
  return vm;
}, name: 'appPreferencesViewModel');
