import 'package:get/get.dart';

class SelectyourPlancontroller extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Map<String, dynamic>> yourplan = [
    {
      //1
      "title": 'Business',
      "subtitle": "What You’ll Get",
      "text1": "Up to 3 Domains Management",
      "text2": "Up to 3 Hosting Management",
      "text3": "3 Users",
      "text4": "Monthly Backups",
      "text5": "\$0/day"
    },
    {
      //2
      "title": 'Enterprise',
      "subtitle": "What You’ll Get",
      "text1": "Unlimited Domains Management",
      "text2": "Unlimited Hosting Management",
      "text3": "Unlimited Users",
      "text4": "Weekly Backups",
      "text5": "Free Support 24/7",
      'text7': "\$8/month",
    },
  ];
}
