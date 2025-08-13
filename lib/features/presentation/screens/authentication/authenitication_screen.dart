import 'package:flutter_provider_base/index.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLoggedIn = false;

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Consumer<AppPreferencesViewModel>(
        builder: (context, model, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDark
                    ? [const Color(0xFF1E1E1E), const Color(0xFF121212)]
                    : [Colors.blue.shade50, Colors.white],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: AppTitle("Authentication")),
                const SizedBox(height: 20),

                // Login/Logout Button
                if (!_isLoggedIn)
                  AppElevatedButton(
                    isLoading: model.state == ViewState.Loading,
                    onPressed: () {
                      _toggleLoginStatus();
                    },
                    title: "Login",
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      _toggleLoginStatus();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                // Theme Toggle Button (only show when logged in)
                if (_isLoggedIn)
                  AppElevatedButton(
                    isLoading: model.state == ViewState.Loading,
                    onPressed: () async {
                      final themeType =
                          model.userPreferences.themeType == ThemeType.light
                              ? ThemeType.dark
                              : ThemeType.light;
                      final newPrefs = UserPreferencesEntity(
                        username: "1",
                        name: "Khursheed",
                        surename: "Gaddi",
                        themeType: themeType,
                        languageType: LanguageType.english,
                        currency: "inr",
                        themeColor: "red",
                      );

                      "Current: ${model.userPreferences.themeType} | $themeType"
                          .log();
                      await model.updatePreferences(newPrefs);
                    },
                    title: "Toggle Theme",
                  ),

                const SizedBox(height: 20),

                // Status Text
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.2)
                          : Colors.blue.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    _isLoggedIn
                        ? "You are logged in"
                        : "Please login to continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.blue.shade700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
