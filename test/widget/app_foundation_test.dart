import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_state_provider.dart';
import 'package:flutter_riverpod_base/core/errors/failure.dart';
import 'package:flutter_riverpod_base/core/enums/language_type.dart';
import 'package:flutter_riverpod_base/core/enums/theme_type.dart';
import 'package:flutter_riverpod_base/core/enums/view_state.dart';
import 'package:flutter_riverpod_base/features/domain/entities/user_preferences_entity.dart';
import 'package:flutter_riverpod_base/features/domain/repositories/user_preferences_repository.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/preferences/create_user_preferences_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/preferences/get_user_preferences_stream_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/preferences/get_user_preferences_usecase.dart';
import 'package:flutter_riverpod_base/features/domain/usecases/preferences/update_user_preferences_usecase.dart';
import 'package:flutter_riverpod_base/features/presentation/home/app_foundation.dart';
import 'package:flutter_riverpod_base/features/presentation/providers/preferences_view_model.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/authentication/authenitication_screen.dart';
import 'package:flutter_riverpod_base/features/presentation/screens/splash/splash_screen.dart';
import 'package:mocktail/mocktail.dart';

class _MockUserPreferencesRepository extends Mock
    implements UserPreferencesRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const fallbackPrefs = UserPreferencesEntity(
    username: '0',
    name: 'n',
    surename: 's',
    themeType: ThemeType.light,
    languageType: LanguageType.english,
    currency: 'usd',
    themeColor: 'blue',
  );

  setUpAll(() {
    registerFallbackValue(fallbackPrefs);
    registerFallbackValue('');
  });

  AppPreferencesViewModel buildPreferencesViewModel(_MockUserPreferencesRepository repo) {
    return AppPreferencesViewModel(
      getUserPreferencesUsecase: GetUserPreferencesUsecase(repository: repo),
      createUserPreferencesUsecase: CreateUserPreferencesUsecase(repository: repo),
      updateUserPreferencesUsecase: UpdateUserPreferencesUsecase(repository: repo),
      getUserPreferencesStreamUsecase:
          GetUserPreferencesStreamUsecase(repository: repo),
    );
  }

  void stubRepo(_MockUserPreferencesRepository repo) {
    when(() => repo.getUserPreferences(any())).thenAnswer(
      (_) async => const Right<Failure, UserPreferencesEntity?>(null),
    );
    when(() => repo.createUserPreferences(any())).thenAnswer(
      (_) async => Right<Failure, UserPreferencesEntity>(fallbackPrefs),
    );
    when(() => repo.updateUserPreferences(any())).thenAnswer(
      (_) async => Right<Failure, UserPreferencesEntity>(fallbackPrefs),
    );
    when(() => repo.getPreferencesStream(any())).thenAnswer(
      (_) => Stream<Either<Failure, UserPreferencesEntity?>>.value(
        const Right<Failure, UserPreferencesEntity?>(null),
      ),
    );
  }

  testWidgets('AppFoundation shows MaterialApp when preferences are ready', (tester) async {
    final repo = _MockUserPreferencesRepository();
    stubRepo(repo);
    final vm = buildPreferencesViewModel(repo);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPreferencesViewModelProvider.overrideWith((ref) => vm),
        ],
        child: const AppFoundation(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SplashScreen), findsNothing);
    expect(find.byType(AuthenticationScreen), findsOneWidget);
  });

  testWidgets('AppFoundation shows SplashScreen while preferences load', (tester) async {
    final repo = _MockUserPreferencesRepository();
    stubRepo(repo);
    final vm = buildPreferencesViewModel(repo)..setViewState(ViewState.Loading);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPreferencesViewModelProvider.overrideWith((ref) => vm),
        ],
        child: const AppFoundation(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
