import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:test_app/core/utils/extensions.dart';

import '../../../../core/common_widgets/app_textfield.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../../camera/features/screens/camera_screen.dart';
import '../verification_method_button.dart';

class ProofOfResidencyScreen extends StatefulWidget {
  const ProofOfResidencyScreen({super.key});

  @override
  State<ProofOfResidencyScreen> createState() => _ProofOfResidencyScreenState();
}

class _ProofOfResidencyScreenState extends State<ProofOfResidencyScreen> {
  DateTime expiryDate = DateTime.now();
  bool isIdentityCardClicked = false;
  bool isPassportCardClicked = false;
  bool isDriverLicenseCardClicked = false;

  late final TextEditingController expDateController;
  late final TextEditingController idNumberController;

  @override
  void initState() {
    expDateController = TextEditingController();
    idNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            80.hi,
            Text(
              'Choose Verification Method',
              style:
                  AppTheme.lightTextTheme.titleLarge?.copyWith(fontSize: 23.sp),
            ),
            32.hi,
            Text(
              'Nationality',
              style: AppTheme.lightTextTheme.titleLarge?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            14.hi,
            Container(
              padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.cameroon),
                      10.wi,
                      Text(
                        'Cameroon',
                        style: AppTheme.lightTextTheme.bodyLarge,
                      ),
                    ],
                  ),

                  InkWell(
                    child: Text(
                      'Change',
                      style: AppTheme.lightTextTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.blue),
                    ),
                  )
                ],
              ),
            ),
            21.hi,
            Text(
              'Verification method',
              style: AppTheme.lightTextTheme.titleLarge?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.28.hi,
            VerificationMethodButton(
              onTap: () {
                setState(() {
                  isIdentityCardClicked = true;
                  isPassportCardClicked = false;
                  isDriverLicenseCardClicked = false;
                });
                log('idcard $isIdentityCardClicked');
              },
              isClicked: isIdentityCardClicked,
              label: 'National Identity Card',
            ),
            10.hi,
            VerificationMethodButton(
              onTap: () {
                setState(() {
                  isIdentityCardClicked = false;
                  isPassportCardClicked = true;
                  isDriverLicenseCardClicked = false;
                });
              },
              isClicked: isPassportCardClicked,
              label: 'Passport',
            ),
            10.hi,
            VerificationMethodButton(
              onTap: () {
                setState(() {
                  isIdentityCardClicked = false;
                  isPassportCardClicked = false;
                  isDriverLicenseCardClicked = true;
                });
              },
              isClicked: isDriverLicenseCardClicked,
              label: 'Driver License',
            ),
            10.hi,
            AppTextField(
              readOnly: true,
              fillColor: AppColors.grey,
              controller: expDateController,
              hintText: expDateController.text.isNotEmpty
                  ? DateFormat('yyyy-MM-dd').format(expiryDate)
                  : 'ID Expiry Date',
              border: InputBorder.none,
              suffixIcon: SvgPicture.asset(
                AppIcons.calendar,
                fit: BoxFit.scaleDown,
                height: 20,
                width: 20,
              ),
              onTap: () async {
                final currentDate = DateTime.now();
                final datePicker = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(currentDate.year - 0),
                    lastDate: DateTime(currentDate.year + 100));
                if (datePicker != null) {
                  expiryDate = datePicker;
                  expDateController.text =
                      DateFormat('yyyy-MM-dd').format(expiryDate);
                }
              },
            ),
            10.hi,
            AppTextField(
              fillColor: AppColors.grey,
              controller: idNumberController,
              hintText: 'ID Number',
              border: InputBorder.none,
              keyboardType: TextInputType.number,
            ),
            61.hi,
            GestureDetector(
              onTap: () async {
                final cameras = await availableCameras();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CameraScreen(
                    cameras: cameras,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Verify Identity',
                    style: AppTheme.lightTextTheme.bodyLarge?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).padHorizontal(20),
      )),
    );
  }
}
