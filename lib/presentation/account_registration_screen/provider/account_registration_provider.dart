import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../providers/auth_provider.dart';
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

  void onEmailSignInPressed(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.loadEditions();
    authProvider.loadPasswordComplexity();
    NavigatorService.pushNamed(AppRoutes.passwordSetupScreen);
  }
}
