import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../providers/auth_provider.dart';
import '../models/password_setup_model.dart';

class PasswordSetupProvider extends ChangeNotifier {
  PasswordSetupModel passwordSetupModel = PasswordSetupModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isFormValid = false;
  bool hasMinLength = false;
  bool hasUppercase = false;

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

  String? validatePassword(String? value, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.validatePassword(value);
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
    final password = passwordController.text;
    hasMinLength = password.length >= 7;
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    isFormValid = validateEmail(emailController.text) == null && hasMinLength && hasUppercase;
    notifyListeners();
  }

  Color getStrengthBarColor() {
    if (passwordController.text.isEmpty) return appTheme.gray_100;
    if (hasMinLength && hasUppercase) return appTheme.green_400;
    if (hasMinLength || hasUppercase) return Colors.yellow;
    return Colors.red;
  }

  double getStrengthBarWidth() {
    if (passwordController.text.isEmpty) return 0;
    if (hasMinLength && hasUppercase) return 182.h;
    if (hasMinLength || hasUppercase) return 121.h;
    return 61.h;
  }

  Future<void> onConfirmPasswordPressed(GlobalKey<FormState> formKey, BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setRegistrationData(
      email: emailController.text,
      password: passwordController.text,
    );

    isLoading = false;
    notifyListeners();

    NavigatorService.pushNamed(AppRoutes.companyRegistrationScreen);
  }
}
