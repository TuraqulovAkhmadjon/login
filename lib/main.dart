import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:recipe_app/features/auth/presentation/pages/login_view.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_up_view.dart';
import 'core/client.dart';
import 'core/l10n/app_localizations.dart';
import 'core/utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
        Provider(create: (context) => ApiClient()),
        ProxyProvider<ApiClient, AuthRepository>(
          update: (context, client, previous) => AuthRepository(client: client),
        ),
      ],
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationViewModel>(
      builder: (context, localization, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          routerConfig: router,
          locale: localization.currentLocale,
          supportedLocales: const [
            Locale("uz"),
            Locale("en"),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            MyLocalizations.delegate,
          ],
        );
      },
    );
  }
}

class LocalizationViewModel extends ChangeNotifier {
  Locale _currentLocale = const Locale("uz");

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }
}

GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => const SignUpView()),
  ],
);
