import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/demo_session_provider.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';

/// Drives [GoRouter.redirect] when session or preferences loading changes.
final class GoRouterRefresh extends ChangeNotifier {
  GoRouterRefresh(this._ref) {
    _ref.listen<bool>(demoGallerySignedInProvider, (_, __) => notifyListeners());
    _ref.listen(appPreferencesViewModelProvider, (_, __) => notifyListeners());
  }

  final Ref _ref;
}
