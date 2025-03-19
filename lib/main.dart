import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/dependencies.dart';
import 'core/client.dart';
import 'core/l10n/app_localizations.dart';
import 'core/utils/theme.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'core/router.dart';

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

class RecipeApp  extends StatelessWidget {
  const RecipeApp({super.key});

  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(430, 932));
    return Consumer<LocalizationViewModel>(
       builder: (context, localization, child) {
        return MultiProvider(
          providers: providers,
          builder: (context, child) => MaterialApp.router(
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
          ),
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
