import 'package:get/get.dart';

class BookingCompleteController extends GetxController{

  var isCompleted = false.obs;


  

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 800), () {
      isCompleted.value = true;
    });
  }
}