
// import 'package:get/get.dart';

// class ProductController extends GetxController {
//   // For toggle button states
//   RxBool isVendorSelected = false.obs;
//   RxBool isStoreSelected = false.obs;

//   // For tab selection
//   RxInt selectedIndex = 0.obs;

//   // Function to toggle the Vendor filter
//   void toggleVendor() {
//     isVendorSelected.value = !isVendorSelected.value;
//   }

//   // Function to toggle the Store filter
//   void toggleStore() {
//     isStoreSelected.value = !isStoreSelected.value;
//   }

//   // Function to change selected tab
//   void changeTab(int index) {
//     selectedIndex.value = index;
//   }

//   List<String> categories = ["All", "Clothing", "Footwear", "Electronic"];
// }
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isVendorSelected = false.obs;
  RxBool isStoreSelected = false.obs;

  void toggleVendor() {
    isVendorSelected.value = !isVendorSelected.value;
  }

  void toggleStore() {
    isStoreSelected.value = !isStoreSelected.value;
  }
}
