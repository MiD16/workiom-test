import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/password_setup_model.dart';

class PasswordSetupProvider extends ChangeNotifier {
  PasswordSetupModel passwordSetupModel = PasswordSetupModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isFormValid = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialize() {
    emailController.text = passwordSetupModel.email ?? '';
    passwordController.text = passwordSetupModel.password ?? '';
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password is required';
    }
    if ((value?.length ?? 0) < 7) {
      return 'Password must have at least 7 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value!)) {
      return 'Password must have at least one uppercase letter';
    }
    return null;
  }

  void onEmailChanged(String value) {
    passwordSetupModel.email = value;
    _validateForm();
  }

  void onPasswordChanged(String value) {
    passwordSetupModel.password = value;
    _validateForm();
  }

  void _validateForm() {
    isFormValid = validateEmail(emailController.text) == null &&
        validatePassword(passwordController.text) == null;
    notifyListeners();
  }

  Future<void> onConfirmPasswordPressed(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    passwordSetupModel.email = emailController.text;
    passwordSetupModel.password = passwordController.text;

    emailController.clear();
    passwordController.clear();

    isLoading = false;
    notifyListeners();

    NavigatorService.pushNamed(AppRoutes.accountRegistrationScreen);
  }
}
