import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/themes/app_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextStyle? style;
  final TextStyle? hintStyle, prefixStyle, defaultLabelStyle;
  final Widget? suffixIcon;
  final Color? fillColor;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final String? prefixText;
  final Widget? suffix, prefixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? label, defaultLabelText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? defaultWidgetLabel;
  final void Function()? onTap;
  final int? maxLines;

  const AppTextField(
      {required this.controller,
        required this.hintText,
        this.readOnly = false,
        this.keyboardType,
        this.suffixText,
        this.suffixStyle,
        this.defaultLabelStyle,
        this.style,
        this.suffixIcon,
        this.fillColor,
        this.hintStyle,
        this.radius,
        this.contentPadding,
        this.filled = true,
        this.prefixText,
        this.suffix,
        this.prefixStyle,
        this.prefixIcon,
        this.validator,
        this.autovalidateMode,
        this.onChanged,
        this.enabledBorder,
        this.focusedBorder,
        this.border,
        this.label,
        this.defaultLabelText,
        this.inputFormatters,
        this.floatingLabelBehavior,
        this.defaultWidgetLabel,
        this.onTap,
        this.maxLines,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: AppTheme.lightTextTheme.bodyLarge?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          onTap: onTap,
          style: style ??
              AppTheme.lightTextTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.black,
              ),
          decoration: InputDecoration(
            label: defaultWidgetLabel,
            labelText: defaultLabelText,
            labelStyle: defaultLabelStyle ??
                AppTheme.lightTextTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
            floatingLabelBehavior: floatingLabelBehavior,
            prefixIcon: prefixIcon,
            prefixText: prefixText,
            prefixStyle: prefixStyle ??
                AppTheme.lightTextTheme.bodyLarge?.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                ),
            contentPadding: contentPadding ??  EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
            hintText: hintText,
            hintStyle: hintStyle ??
                AppTheme.lightTextTheme.displaySmall
                    ?.copyWith(color: AppColors.black,fontSize: 15.sp,fontWeight: FontWeight.w400,),
            filled: filled,
            fillColor: fillColor ?? AppColors.black.withOpacity(0.5),
            suffixText: suffixText,
            suffixStyle: suffixStyle,
            suffixIcon: suffixIcon,
            suffix: suffix,
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10.0),
                  borderSide: filled
                  // ? BorderSide.none
                      ? BorderSide(
                      width: 0.2,
                      color: AppColors.grey)
                      : BorderSide(
                    width: 0.2,
                    color: AppColors.grey,
                  ),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10.0.r),
                  borderSide: filled
                      ? BorderSide(
                    width: 0.2,
                    color: AppColors.grey,
                  )
                      : BorderSide(
                      width: 1,
                      color: AppColors.grey),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10.0.r),
                  borderSide: filled
                      ? BorderSide(
                    width: 0.2,
                    color: AppColors.grey,
                  )
                      : const BorderSide(
                      width: 1, color: AppColors.grey),
                ),
          ),
        ),
      ],
    );
  }
}
