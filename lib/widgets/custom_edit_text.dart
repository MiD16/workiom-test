import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText({
    super.key,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.controller,
    this.enabled,
    this.maxLines,
    this.contentPadding,
    this.borderDecoration,
  });
  
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? enabled;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      onTap: onTap,
      enabled: enabled ?? true,
      maxLines: maxLines ?? 1,
      style: textStyle ?? TextStyleHelper.instance.body15RegularRubik,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyleHelper.instance.body15RegularRubik,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
        border:
            borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(color: appTheme.colorFFE0E0, width: 1.h),
            ),
        enabledBorder:
            borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(color: appTheme.colorFFE0E0, width: 1.h),
            ),
        focusedBorder:
            borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(color: appTheme.black_900, width: 2.h),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.redCustom, width: 1.h),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.redCustom, width: 2.h),
        ),
      ),
    );
  }
}
