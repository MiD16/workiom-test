import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workiom/presentation/controllers/signup_controller.dart';
import 'package:workiom/presentation/pages/home_page.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_image_view.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({super.key});

  @override
  State<CompanyRegistrationScreen> createState() =>
      _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: CustomAppBar(onBackPressed: () => Navigator.of(context).pop()),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Consumer<SignupController>(
            builder: (context, provider, child) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, right: 16.h, left: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter your company name',
                          style: TextStyleHelper.instance.title22MediumRubik,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgEmojioneWaving,
                            width: 22.h,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'Let\'s start an amazing journey!',
                          style: TextStyleHelper.instance.title17RegularRubik,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgEmojioneWaving,
                            width: 22.h,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 82.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your  company or team name',
                          style: TextStyleHelper.instance.body15RegularRubik
                              .copyWith(color: appTheme.black_900),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 2.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGeneralPublick,
                                width: 16.h,
                                height: 16.h,
                              ),
                            ),
                            SizedBox(width: 8.h),
                            Expanded(
                              child: CustomEditText(
                                controller: provider.teamNameController,
                                hintText: 'MyWorkiom',
                                contentPadding: EdgeInsets.only(
                                  top: 4.h,
                                  right: 94.h,
                                  bottom: 4.h,
                                  left: 2.h,
                                ),
                                validator:
                                    (value) => provider.validateTeamName(value),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your  first name',
                          style: TextStyleHelper.instance.body15RegularRubik
                              .copyWith(color: appTheme.black_900),
                        ),
                        SizedBox(height: 18.h),
                        Container(
                          margin: EdgeInsets.only(left: 2.h),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 2.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgFieldText,
                                  width: 16.h,
                                  height: 16.h,
                                ),
                              ),
                              SizedBox(width: 4.h),
                              Expanded(
                                child: CustomEditText(
                                  controller: provider.firstNameController,
                                  hintText: 'Irfan',
                                  contentPadding: EdgeInsets.only(
                                    top: 12.h,
                                    right: 2.h,
                                    bottom: 10.h,
                                    left: 2.h,
                                  ),
                                  validator:
                                      (value) =>
                                          provider.validateFirstName(value),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your  last name',
                          style: TextStyleHelper.instance.body15RegularRubik
                              .copyWith(color: appTheme.black_900),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          margin: EdgeInsets.only(left: 2.h),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 2.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgFieldText,
                                  width: 16.h,
                                  height: 16.h,
                                ),
                              ),
                              SizedBox(width: 4.h),
                              Expanded(
                                child: CustomEditText(
                                  controller: provider.lastNameController,
                                  hintText: 'Ozdemir',
                                  contentPadding: EdgeInsets.only(
                                    top: 12.h,
                                    right: 2.h,
                                    bottom: 10.h,
                                    left: 2.h,
                                  ),
                                  validator:
                                      (value) =>
                                          provider.validateLastName(value),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Create Workspace',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          provider.createWorkspace();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (_) => false,
                          );
                        }
                      },
                      backgroundColor: appTheme.blueA200,
                      textColor: appTheme.whiteA700,
                      rightIcon: ImageConstant.imgGroup710,
                      borderRadius: 16.h,
                      fontSize: 15.fontSize,
                      fontWeight: FontWeight.w500,
                      padding: EdgeInsets.only(
                        top: 14.h,
                        bottom: 14.h,
                        left: 30.h,
                      ),
                      margin: EdgeInsets.only(top: 28.h),
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 136.h, bottom: 32.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              'Stay organized with',
                              style:
                                  TextStyleHelper.instance.body15RegularRubik,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLogoSymbol,
                              width: 30.h,
                              height: 30.h,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgWorkiom,
                              width: 62.h,
                              height: 8.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
