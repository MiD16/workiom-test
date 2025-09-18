import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_image_view.dart';
import './provider/password_setup_provider.dart';

class PasswordSetupScreen extends StatefulWidget {
  const PasswordSetupScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PasswordSetupProvider>(
      create: (context) => PasswordSetupProvider()..initialize(),
      child: const PasswordSetupScreen(),
    );
  }

  @override
  State<PasswordSetupScreen> createState() => _PasswordSetupScreenState();
}

class _PasswordSetupScreenState extends State<PasswordSetupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: CustomAppBar(
        onBackPressed: () => NavigatorService.goBack(),
      ),
      body: Form(
        key: _formKey,
        child: Consumer<PasswordSetupProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(context),
                  SizedBox(height: 80.h),
                  _buildFormSection(context, provider),
                  SizedBox(height: 136.h),
                  _buildFooterSection(context),
                  SizedBox(height: 32.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter a strong password',
            style: TextStyleHelper.instance.title22MediumRubik,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Let\'s start an amazing journey!',
                style: TextStyleHelper.instance.title17RegularRubik,
              ),
              SizedBox(width: 8.h),
              CustomImageView(
                imagePath: ImageConstant.imgEmojioneWaving,
                height: 22.h,
                width: 22.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(
      BuildContext context, PasswordSetupProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEmailSection(context, provider),
        SizedBox(height: 26.h),
        _buildPasswordSection(context, provider),
        SizedBox(height: 16.h),
        _buildPasswordStrengthIndicator(context),
        SizedBox(height: 10.h),
        _buildPasswordRequirements(context),
        SizedBox(height: 30.h),
        _buildConfirmButton(context, provider),
      ],
    );
  }

  Widget _buildEmailSection(
      BuildContext context, PasswordSetupProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your work email',
          style: TextStyleHelper.instance.body15RegularRubik,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgFieldEmail,
                height: 16.h,
                width: 16.h,
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: CustomEditText(
                controller: provider.emailController,
                placeholder: 'reem.alfattal@tech_deal.com',
                rightImage: ImageConstant.imgFrame827298,
                textStyle: TextStyleHelper.instance.body15RegularRubik,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.h),
                validator: provider.validateEmail,
                onChanged: provider.onEmailChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordSection(
      BuildContext context, PasswordSetupProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your password',
          style: TextStyleHelper.instance.body15RegularRubik,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgConfiguration,
                height: 16.h,
                width: 16.h,
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: CustomEditText(
                controller: provider.passwordController,
                placeholder: '*****************',
                passwordField: true,
                rightImage: ImageConstant.imgConfigurationShow,
                textStyle: TextStyleHelper.instance.body15RegularRubik,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.h),
                validator: (value) => provider.validatePassword(value, context),
                onChanged: provider.onPasswordChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordStrengthIndicator(BuildContext context) {
    return Consumer<PasswordSetupProvider>(
      builder: (context, provider, child) {
        return Container(
          width: 300.h,
          height: 6.h,
          decoration: BoxDecoration(
            color: appTheme.gray_100,
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: provider.getStrengthBarWidth(),
              height: 6.h,
              decoration: BoxDecoration(
                color: provider.getStrengthBarColor(),
                borderRadius: BorderRadius.circular(3.h),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordRequirements(BuildContext context) {
    return Consumer<PasswordSetupProvider>(
      builder: (context, provider, child) {
        return Column(
          spacing: 4.h,
          children: [
            Row(
              children: [
                Icon(
                  provider.hasMinLength && provider.hasUppercase ? Icons.check_circle : Icons.cancel,
                  color: provider.hasMinLength && provider.hasUppercase ? Colors.green : Colors.red,
                  size: 16.h,
                ),
                SizedBox(width: 8.h),
                Text(
                  provider.hasMinLength && provider.hasUppercase ? 'Password is Strong!' : 'Not enough strong',
                  style: TextStyleHelper.instance.body15MediumRubik
                      .copyWith(color: appTheme.blueGray_900),
                ),
              ],
            ),
            Column(
              spacing: 4.h,
              children: [
                Row(
                  children: [
                    Icon(
                      provider.hasMinLength ? Icons.check_circle : Icons.cancel,
                      color: provider.hasMinLength ? Colors.green : Colors.red,
                      size: 16.h,
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      'Passwords must have at least 7 characters',
                      style: TextStyleHelper.instance.body12RegularRubik,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      provider.hasUppercase ? Icons.check_circle : Icons.cancel,
                      color: provider.hasUppercase ? Colors.green : Colors.red,
                      size: 16.h,
                    ),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: Text(
                        'Passwords must have at least one uppercase (\'A\'-\'Z\').',
                        style: TextStyleHelper.instance.body12RegularRubik,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildConfirmButton(
      BuildContext context, PasswordSetupProvider provider) {
    return CustomButton(
      text: 'Confirm password',
      backgroundColor: provider.isFormValid ? appTheme.blueA200 : appTheme.gray_600,
      textColor: appTheme.whiteA700,
      rightIcon: ImageConstant.imgGroup710,
      onPressed: provider.isFormValid ? () => provider.onConfirmPasswordPressed(_formKey, context) : null,
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Text(
            'Stay organized with',
            style: TextStyleHelper.instance.body15RegularRubik
                .copyWith(color: appTheme.gray_700),
          ),
        ),
        SizedBox(width: 8.h),
        CustomImageView(
          imagePath: ImageConstant.imgLogoSymbol,
          height: 30.h,
          width: 30.h,
        ),
        SizedBox(width: 2.h),
        CustomImageView(
          imagePath: ImageConstant.imgWorkiom,
          height: 8.h,
          width: 62.h,
        ),
      ],
    );
  }
}
