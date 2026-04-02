import 'package:flutter_riverpod_base/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: scheme.primary,
        child: Center(
          child: AppSpinner(color: scheme.onPrimary),
        ),
      ),
    );
  }
}
