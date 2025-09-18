import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/account_registration_model.dart';

class AccountRegistrationProvider extends ChangeNotifier {
  AccountRegistrationModel accountRegistrationModel =
      AccountRegistrationModel();
  bool isLoading = false;

  void initialize() {
    // Initialize any required data
  }

  void onGoogleSignInPressed() {
    debugPrint('Google sign in pressed');
  }

  void onEmailSignInPressed() {
    // Navigate to password setup screen or email sign in screen
    NavigatorService.pushNamed(AppRoutes.passwordSetupScreen);
  }
}
