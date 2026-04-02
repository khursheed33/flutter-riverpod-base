import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/app/observers/logging_riverpod_observer.dart';
import 'package:flutter_riverpod_base/index.dart';
import 'package:url_strategy/url_strategy.dart';

/// The main function initializes dependencies, starts the app, and logs any errors that occur.
Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      if (kIsWeb) {
        setPathUrlStrategy();
      }
      await initializeDependencies();
      // Start App
      runApp(
        ProviderScope(
          observers: [
            if (kDebugMode) const LoggingRiverpodObserver(),
          ],
          child: const AppFoundation(),
        ),
      );
    },
    (error, stackTrace) {
      // Log error
      logError(error, stackTrace);
    },
  );
}
