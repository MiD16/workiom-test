import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './provider/thank_you_provider.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ThankYouProvider>(
      create: (context) => ThankYouProvider(),
      child: const ThankYouScreen(),
    );
  }

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ThankYouProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: Consumer<ThankYouProvider>(
        builder: (context, provider, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              boxShadow: [
                BoxShadow(
                  color: appTheme.black_900_19,
                  offset: Offset(0, 50.h),
                  blurRadius: 100.h,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      _buildThankYouSection(),
                      Spacer(),
                      _buildBottomBrandingSection(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildThankYouSection() {
    return Container(
      width: double.infinity,
      height: 56.h,
      margin: EdgeInsets.only(left: 12.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 98.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgLogoSymbol,
                height: 28.h,
                width: 28.h,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Thank you for choosing\nWorkiom',
              style: TextStyleHelper.instance.title22MediumRubik
                  .copyWith(height: 1.27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBrandingSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 54.h, vertical: 76.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.h),
            child: Text(
              'Stay organized with',
              style: TextStyleHelper.instance.body15RegularRubik
                  .copyWith(height: 1.2),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgLogoSymbol,
              height: 30.h,
              width: 30.h,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgWorkiom,
              height: 8.h,
              width: 62.h,
            ),
          ),
        ],
      ),
    );
  }
}
