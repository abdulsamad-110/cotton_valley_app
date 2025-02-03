import 'package:get/get.dart';

class ProductController extends GetxController{

  // RxInt selectedIndex = 0.obs; 

  // void selectButton(int index) {
  //   selectedIndex.value = index;
  // }
  
  RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
  List<String> categories = ["All", "Clothing", "Footwear", "Electronic"];
}