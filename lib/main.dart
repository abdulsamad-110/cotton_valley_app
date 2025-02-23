import 'package:cotton_valley_app/ui/add_vendor/add_vendor_view.dart';
import 'package:cotton_valley_app/ui/product_detail/product_detail_view.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'services/storage_services/local_storage_services.dart';
import 'ui/auth/splash/splash_view.dart';
import 'utils/common_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,

  await LocalStorage.initialize();
  //await CommonFunctions.getCurrentCity();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.whiteColor),
          home: const SplashView(),
          //home: ProductdetailView(),
        );
      },
    );
  }
}
