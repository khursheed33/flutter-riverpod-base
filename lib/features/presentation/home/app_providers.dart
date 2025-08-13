import 'package:flutter_provider_base/index.dart';

/// The class AppProviders provides a list of providers for the app

abstract class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider<AuthViewModel>(
      create: (_) => locator<AuthViewModel>(),
    ),
    ChangeNotifierProvider<AppPreferencesViewModel>(
      create: (_) {
        final viewModel = locator<AppPreferencesViewModel>();
        // Initialize preferences when the provider is created
        viewModel.init();
        return viewModel;
      },
    ),
  ];
}
