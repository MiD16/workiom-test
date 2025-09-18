import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';
class CustomEditText extends StatefulWidget {
  const CustomEditText({
    super.key,
    this.placeholder,
    this.passwordField = false,
    this.rightImage,
    this.textStyle,
    this.padding,
    this.validator,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
    this.onTap,
  });

  final String? placeholder;

  final bool passwordField;

  final String? rightImage;

  final TextStyle? textStyle;

  final EdgeInsetsGeometry? padding;

  final String? Function(String?)? validator;

  final TextEditingController? controller;

  final Function(String)? onChanged;

  final bool enabled;

  final TextInputType? keyboardType;

  final VoidCallback? onTap;

  @override
  CustomEditTextState createState() => CustomEditTextState();
}

class CustomEditTextState extends State<CustomEditText> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.passwordField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: widget.validator,
      style: widget.textStyle ?? TextStyleHelper.instance.body15RegularRubik,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: TextStyleHelper.instance.body15RegularRubik.copyWith(
          color: Color(0xFF0E0F12).withAlpha(153),
        ),
        contentPadding:
            widget.padding ??
            EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.colorFFE5E5, width: 1.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.colorFFE5E5, width: 1.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.black_900, width: 1.h),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.redCustom, width: 1.h),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(color: appTheme.redCustom, width: 1.h),
        ),
        suffixIcon:
            widget.rightImage != null
                ? _buildSuffixIcon()
                : widget.passwordField
                ? _buildPasswordToggle()
                : null,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (widget.passwordField) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: widget.rightImage!,
            height: 24.h,
            width:
                widget.rightImage!.contains('img_frame_827298') ? 28.h : 20.h,
          ),
          SizedBox(width: 8.h),
          _buildPasswordToggle(),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.all(12.h),
      child: CustomImageView(
        imagePath: widget.rightImage!,
        height: 24.h,
        width: widget.rightImage!.contains('img_frame_827298') ? 28.h : 20.h,
      ),
    );
  }

  Widget _buildPasswordToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Color(0xFF0E0F12).withAlpha(153),
        size: 20.h,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
