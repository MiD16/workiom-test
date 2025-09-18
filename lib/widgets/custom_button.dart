import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.rightIcon,
    this.padding,
    this.margin,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
  });

  final String text;

  final VoidCallback? onPressed;

  final Color? backgroundColor;

  final Color? textColor;

  final String? rightIcon;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final double? borderRadius;

  final double? fontSize;

  final FontWeight? fontWeight;

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 28.h),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFF4E86F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.h),
          ),
          padding:
              padding ??
              EdgeInsets.only(top: 14.h, bottom: 14.h, left: 30.h, right: 30.h),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyleHelper.instance.body12RegularRubik.copyWith(
                  color: textColor ?? Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            if (rightIcon != null) ...[
              SizedBox(width: 8.h),
              CustomImageView(imagePath: rightIcon!, height: 16.h, width: 24.h),
            ],
          ],
        ),
      ),
    );
  }
}
