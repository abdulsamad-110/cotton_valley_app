import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_view.dart';
import 'package:cotton_valley_app/ui/user/navigation/navigation_view.dart';
//import 'package:cotton_valley_app/widgets/motion_tab_bar_view.dart'; // Bottom Nav import kiya hai
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // 3 seconds ke baad bottom navigation view ko navigate karenge
      Get.off(() => NavigationView()); // Splash ke baad MotionTabBarview
    });
  }
}
