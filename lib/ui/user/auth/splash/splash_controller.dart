import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_view.dart';
import 'package:cotton_valley_app/ui/user/home/home_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const SigninView());
    });
  }
}
