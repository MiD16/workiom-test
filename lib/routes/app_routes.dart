import 'package:flutter/material.dart';
import '../presentation/account_registration_screen/account_registration_screen.dart';
import '../presentation/password_setup_screen/password_setup_screen.dart';

import '../presentation/company_registration_screen/company_registration_screen.dart';
import '../presentation/thank_you_screen/thank_you_screen.dart';

class AppRoutes {
  static const String accountRegistrationScreen =
      '/account_registration_screen';
  static const String passwordSetupScreen = '/password_setup_screen';

  static const String initialRoute = '/splash_screen';

  static Map<String, WidgetBuilder> get routes => {
        accountRegistrationScreen: AccountRegistrationScreen.builder,
        passwordSetupScreen: PasswordSetupScreen.builder,
        companyRegistrationScreen: CompanyRegistrationScreen.builder,
        thankYouScreen: ThankYouScreen.builder,
      };
  static const String companyRegistrationScreen =
      '/company_registration_screen';
  static const String thankYouScreen = '/thank_you_screen';
}
