import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/core/utils/themes/app_theme.dart';
import 'package:test_app/main.dart';

import '../../../../core/utils/app_icons.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({required this.cameras, super.key});

  final List<CameraDescription> cameras;

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;

  List<XFile> ImagesList = [];
  bool isRearCamera = true;
  bool isFlashOn = false;
  XFile? capturedImage;

  void takePicture() async {
    XFile? image;
    if (cameraController.value.isTakingPicture ||
        !cameraController.value.isInitialized) {
      return;
    }
    image = await cameraController.takePicture();

    if (cameraController.value.flashMode == FlashMode.torch) {
      setState(() {
        cameraController.setFlashMode(FlashMode.off);
      });
    }
    setState(() {
      capturedImage = image;
    });
  }

  void startCamera(int camera) {
    cameraController = CameraController(
      widget.cameras[camera],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    startCamera(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        width: 100,
                        child: capturedImage != null
                            ? Image.file(File(capturedImage!.path))
                            : CameraPreview(cameraController)),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        Positioned(
          top: 130,
          left: 8,
          right: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Photo ID Card',
                style: AppTheme.lightTextTheme.displayLarge?.copyWith(
                    fontSize: 38.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400),
              ),
              18.hi,
              Text(
                'Please point the camera at the ID card. Position it inside the frame. Make sure it is clear enough',
                // textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                style: AppTheme.lightTextTheme.displayLarge?.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
        },
                child: SvgPicture.asset(AppIcons.arrowLeft),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isRearCamera = !isRearCamera;
                      });
                      isRearCamera ? startCamera(0) : startCamera(1);
                    },
                    child: SvgPicture.asset(AppIcons.rotate),
                  ),
                  20.wi,
                  SvgPicture.asset(AppIcons.time),
                  20.wi,
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlashOn = !isFlashOn;
                      });
                    },
                    child: SvgPicture.asset(AppIcons.flashlight),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 60.h,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppIcons.mask,
                fit: BoxFit.scaleDown,
                height: 42.53.w,
              ),
              70.wi,
              InkWell(
                onTap: takePicture,
                child: SvgPicture.asset(
                  AppIcons.captureIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              70.wi,
              SvgPicture.asset(AppIcons.saveIcon),
            ],
          ),
        ),
      ],
    ).padHorizontal(16));
  }
}
