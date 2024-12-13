import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/features/camera/features/screens/camera_screen.dart';

import 'core/utils/themes/app_theme.dart';
import 'features/proof_of_residency/features/screens/proof_of_residency_screen.dart';

// final availableCameraStateProvider = StateProvider<List<CameraDescription>>((ref) => <CameraDescription>[]);
// late ProviderContainer providerContainer;
void main() async{
  // try {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   providerContainer = ProviderContainer();
  //   List<CameraDescription> _cameras = <CameraDescription>[];
  //   _cameras = await availableCameras();
  //   providerContainer.read(availableCameraStateProvider.notifier).state = _cameras;
  // } on CameraException catch (e) {
  //   log('camera error: ${e.code} ${e.description}',);
  // }

  runApp(const TestApp());
}



class TestApp extends StatelessWidget {
  const TestApp({super.key});



  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.lightTheme();
    return ProviderScope(
      // parent: providerContainer,
      child: ScreenUtilInit(
        designSize: const Size(390, 852),
        ensureScreenSize: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {

          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: ProofOfResidencyScreen(),
          );
        }
      ),
    );
  }
}
