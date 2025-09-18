// ignore_for_file: must_be_immutable
class AccountRegistrationModel {
  AccountRegistrationModel({
    this.welcomeTitle,
    this.welcomeSubtitle,
    this.googleButtonText,
    this.emailButtonText,
    this.termsText,
    this.languageText,
    this.brandingText,
  }) {
    welcomeTitle = welcomeTitle ?? 'Create your free account';
    welcomeSubtitle = welcomeSubtitle ?? 'Let\'s start an amazing journey!';
    googleButtonText = googleButtonText ?? 'Continue with Google';
    emailButtonText = emailButtonText ?? 'Continue with email';
    termsText =
        termsText ??
        'By signing up, you agree Terms Of Service\nAnd Privacy Policy';
    languageText = languageText ?? 'English';
    brandingText = brandingText ?? 'Stay organized with';
  }

  String? welcomeTitle;
  String? welcomeSubtitle;
  String? googleButtonText;
  String? emailButtonText;
  String? termsText;
  String? languageText;
  String? brandingText;
}
