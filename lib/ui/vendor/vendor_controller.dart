import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  RxString selectedCountry = "".obs;

  void setCountry(String country) {
    selectedCountry.value;
    //countryController.text;
  }
}
