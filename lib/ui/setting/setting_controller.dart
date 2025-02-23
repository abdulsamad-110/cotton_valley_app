import 'package:get/get.dart';

import '../../services/auth_services/auth_services.dart';

class SettingController extends GetxController{
  

  logOut() async {
    final data=await AuthServices.logOutRequest().then((e){
     return true;
    });
  }
}