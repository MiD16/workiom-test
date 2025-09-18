import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/account_registration_provider.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AccountRegistrationProvider>(
      create: (context) => AccountRegistrationProvider()..initialize(),
      child: const AccountRegistrationScreen(),
    );
  }

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
          boxShadow: [
            BoxShadow(
              color: appTheme.black_900_19,
              offset: const Offset(0, 50),
              blurRadius: 100,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: _buildMainContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      title: 'Sign in',
      onBackPressed: () {
        NavigatorService.goBack();
      },
    );
  }

  Widget _buildMainContent() {
    return Consumer<AccountRegistrationProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
          child: Column(
            children: [
              _buildWelcomeSection(),
              const Spacer(),
              _buildLanguageSection(),
              SizedBox(height: 16.h),
              _buildBrandingSection(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeSection() {
    return Consumer<AccountRegistrationProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your free account',
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
            SizedBox(height: 136.h),
            CustomButton(
              text: 'Continue with Google',
              backgroundColor: appTheme.gray_100,
              textColor: appTheme.black_900,
              rightIcon: ImageConstant.imgFlatcoloriconsgoogle,
              onPressed: () {
                provider.onGoogleSignInPressed();
              },
            ),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                'Or',
                style: TextStyleHelper.instance.body12RegularRubik
                    .copyWith(color: appTheme.colorB25555),
              ),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              text: 'Continue with email',
              backgroundColor: appTheme.blueA200,
              textColor: appTheme.whiteCustom,
              rightIcon: ImageConstant.imgGroup710,
              onPressed: () {
                provider.onEmailSignInPressed();
              },
            ),
            SizedBox(height: 16.h),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing up, you agree ',
                      style: TextStyleHelper.instance.body13RegularRubik,
                    ),
                    TextSpan(
                      text: 'Terms Of Service\n',
                      style: TextStyleHelper.instance.body13RegularRubik
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: 'And ',
                      style: TextStyleHelper.instance.body13RegularRubik,
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyleHelper.instance.body13RegularRubik
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgSearch,
          height: 16.h,
          width: 16.h,
        ),
        SizedBox(width: 8.h),
        Text(
          'English',
          style: TextStyleHelper.instance.body12RegularRubik,
        ),
        SizedBox(width: 8.h),
        CustomImageView(
          imagePath: ImageConstant.imgPolygon6,
          height: 4.h,
          width: 6.h,
        ),
      ],
    );
  }

  Widget _buildBrandingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Stay organized with',
          style: TextStyleHelper.instance.body15RegularRubik
              .copyWith(color: appTheme.gray_700),
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
