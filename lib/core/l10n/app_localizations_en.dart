// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MyLocalizationsEn extends MyLocalizations {
  MyLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signUp => 'Sign Up';

  @override
  String get first_name => 'First Name';

  @override
  String get last_name => 'Last Name';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get password => 'Password';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get passwords_do_not_match => 'Passwords do not match!';

  @override
  String get sign_up_successful => 'Sign Up Successful!';

  @override
  String get sign_up_success_message => 'You have successfully signed up! Welcome!';

  @override
  String get login => 'Login';
}
