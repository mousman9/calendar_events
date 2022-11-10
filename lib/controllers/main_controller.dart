import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderAppController extends GetxController {
  late TabController tabController;

  int tabIndex = 0;
  String email = '';
  String name = '';
  String pic = '';

  // get user locally saved data
  // getData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   pic = sharedPreferences.getString('pic') ?? '';
  //   name = sharedPreferences.getString('name') ?? '';
  //   email = sharedPreferences.getString('email') ?? '';
  //   update();
  // }

  changeIndex(int index) {
    tabIndex = index;
    update();
  }

  // signout() async {
  //   await GoogleSignIn().signOut();
  //   Get.offAll(() => const SignIn());
  // }
}
