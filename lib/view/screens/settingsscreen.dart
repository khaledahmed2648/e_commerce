import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/addtocrardbuttonitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AddToCardButtonItemOrBuy(
              text: 'Log Out',
              onTap: () {
                Get.toNamed(AppRoutes.login);
                MyServices.sharedPreferences.clear();
                MyServices.sharedPreferences.setBool('onBoarding', true);
              })),
    );
  }
}
