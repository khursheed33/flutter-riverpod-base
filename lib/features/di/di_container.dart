import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod_base/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Service locator for **services** (Dio, repos, use cases). Do not register app-wide [ChangeNotifier]s here;
/// those belong in Riverpod (`app/providers/app_providers.dart` + `*_state_provider.dart`).
///
/// **Add a feature:** register new repos / data sources / use cases in the `Di*` classes.
/// **Remove a feature:** delete its registrations and files, then remove the Riverpod provider export.
final GetIt locator = GetIt.instance;
late SharedPreferences preferences;

Future<void> initializeHive() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveCollections.localDB);
  'Hive Box: initialized (hive_flutter — mobile, desktop, web)'.log();
}

Future<SharedPreferences> initializeSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

Future<void> initializeDependencies() async {
  // Initializations::::::::::::::::::::::::::::::::::::
  preferences = await initializeSharedPreferences();
  await initializeHive();

  // ------------------------------------------------------
  // Presentation state: Riverpod providers (see app/providers/app_providers.dart).
  //:::::::::::::::: USECASES :::::::::::::::::::::::::::::
  DiUsecases(locator: locator);
  //::::::::::::::: DATA SOURCES ::::::::::::::::::::::::::
  DiDatasources(locator: locator);
  //:::::::::::::::  REPOSITORIES :::::::::::::::::::::::::
  DiRepositories(locator: locator);
  // :::::::: EXTERNAL DATA SOURCES/ DEPENDENCIES :::::::::
  final Dio dio = Dio();
  final Connectivity connectivity = Connectivity();
  final Box hiveBox = Hive.box(HiveCollections.localDB);
  final sharedPreferences = await SharedPreferences.getInstance();
  final AwesomeNotifications notification = AwesomeNotifications();

  locator.registerLazySingleton<Dio>(() => dio);
  locator.registerLazySingleton<Box>(() => hiveBox);
  locator.registerLazySingleton<Connectivity>(() => connectivity);
  locator.registerLazySingleton<AwesomeNotifications>(() => notification);
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
