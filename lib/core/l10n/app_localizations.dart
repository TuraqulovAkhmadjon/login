import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of MyLocalizations
/// returned by `MyLocalizations.of(context)`.
///
/// Applications need to include `MyLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MyLocalizations.localizationsDelegates,
///   supportedLocales: MyLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the MyLocalizations.supportedLocales
/// property.
abstract class MyLocalizations {
  MyLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MyLocalizations? of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  static const LocalizationsDelegate<MyLocalizations> delegate = _MyLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uz')
  ];

  /// No description provided for @signUp.
  ///
  /// In uz, this message translates to:
  /// **'Ro‘yxatdan o‘tish'**
  String get signUp;

  /// No description provided for @first_name.
  ///
  /// In uz, this message translates to:
  /// **'Ism'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In uz, this message translates to:
  /// **'Familiya'**
  String get last_name;

  /// No description provided for @username.
  ///
  /// In uz, this message translates to:
  /// **'Foydalanuvchi nomi'**
  String get username;

  /// No description provided for @email.
  ///
  /// In uz, this message translates to:
  /// **'Elektron pochta'**
  String get email;

  /// No description provided for @phone_number.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqam'**
  String get phone_number;

  /// No description provided for @password.
  ///
  /// In uz, this message translates to:
  /// **'Maxfiy so\'z'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In uz, this message translates to:
  /// **'Maxfiy so\'zni tasdiqlang'**
  String get confirm_password;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In uz, this message translates to:
  /// **'Parollar mos kelmadi!'**
  String get passwords_do_not_match;

  /// No description provided for @sign_up_successful.
  ///
  /// In uz, this message translates to:
  /// **'Ro‘yxatdan o‘tish muvaffaqiyatli!'**
  String get sign_up_successful;

  /// No description provided for @sign_up_success_message.
  ///
  /// In uz, this message translates to:
  /// **'Siz muvaffaqiyatli ro‘yxatdan o‘tdingiz! Xush kelibsiz!'**
  String get sign_up_success_message;

  /// No description provided for @login.
  ///
  /// In uz, this message translates to:
  /// **'Kirish'**
  String get login;
}

class _MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const _MyLocalizationsDelegate();

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(lookupMyLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_MyLocalizationsDelegate old) => false;
}

MyLocalizations lookupMyLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return MyLocalizationsEn();
    case 'uz': return MyLocalizationsUz();
  }

  throw FlutterError(
    'MyLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
