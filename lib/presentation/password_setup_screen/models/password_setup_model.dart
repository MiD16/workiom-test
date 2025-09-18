class PasswordSetupModel {
  PasswordSetupModel({
    this.email,
    this.password,
    this.isEmailValid,
    this.isPasswordValid,
    this.passwordStrength,
  }) {
    email = email ?? "";
    password = password ?? "";
    isEmailValid = isEmailValid ?? false;
    isPasswordValid = isPasswordValid ?? false;
    passwordStrength = passwordStrength ?? 0.0;
  }

  String? email;
  String? password;
  bool? isEmailValid;
  bool? isPasswordValid;
  double? passwordStrength;
}
