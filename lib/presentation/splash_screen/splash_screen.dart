import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthProvider>(context, listen: false).checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLogoSymbol,
                  height: 80.h,
                  width: 80.h,
                ),
                SizedBox(height: 16.h),
                CustomImageView(
                  imagePath: ImageConstant.imgWorkiom,
                  height: 20.h,
                  width: 120.h,
                ),
                if (authProvider.isLoading) ...[
                  SizedBox(height: 32.h),
                  CircularProgressIndicator(
                    color: appTheme.blueA200,
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}