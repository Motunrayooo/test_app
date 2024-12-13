import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/utils/extensions.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/themes/app_theme.dart';

class VerificationMethodButton extends StatelessWidget {
  VerificationMethodButton(
      {required this.onTap,
      required this.label,
      this.isClicked = false,
      super.key});

  final void Function()? onTap;
  final String label;
  bool isClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Row(
          children: [
            isClicked
                ? SvgPicture.asset(AppIcons.activeRadio)
                : SvgPicture.asset(AppIcons.inActiveRadio),
            12.wi,
            Text(
              label,
              style: AppTheme.lightTextTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
