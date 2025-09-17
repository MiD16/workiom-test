import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onBackPressed,
    this.backgroundColor,
  });

  /// Optional title text to display in the AppBar
  final String? title;

  /// Optional callback function when back button is pressed
  final VoidCallback? onBackPressed;

  /// Optional background color for the AppBar
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        padding: EdgeInsets.fromLTRB(16.h, 8.h, 16.h, 8.h),
        child: title != null
            ? Row(
                children: [
                  GestureDetector(
                    onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.h,
                      width: 18.h,
                    ),
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    title!,
                    style: TextStyleHelper.instance.title17RegularRubik
                        .copyWith(color: appTheme.blueA200, height: 21 / 17),
                  ),
                ],
              )
            : GestureDetector(
                onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 24.h,
                  width: 18.h,
                ),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
