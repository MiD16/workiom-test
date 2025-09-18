import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leadingIconPath,
    this.onLeadingPressed,
    this.title,
    this.onBackPressed,
    this.backgroundColor,
    this.padding,
  });

  final String? leadingIconPath;
  final String? title;

  final VoidCallback? onBackPressed;

  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading:
          leadingIconPath != null
              ? Padding(
                padding: padding ?? EdgeInsets.all(16.h),
                child: IconButton(
                  icon: CustomImageView(
                    imagePath: leadingIconPath!,
                    height: 24.h,
                    width: 18.h,
                  ),
                  onPressed:
                      onLeadingPressed ?? () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              )
              : null,
      title: Container(
        padding: EdgeInsets.fromLTRB(16.h, 8.h, 16.h, 8.h),
        child:
            title != null
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
