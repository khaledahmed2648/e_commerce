import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (MyServices.sharedPreferences.getBool('onBoarding') == true) {

        return const RouteSettings(name: AppRoutes.home);
     
    }
  }
}
