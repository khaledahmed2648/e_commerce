import 'package:ecommerce1/data/datasource/static/static.dart';
import 'package:ecommerce1/view/widgets/onBoarding/OnBoardingWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoardingController.dart';

class OnBoarding extends StatelessWidget {

  OnBoardingControllerImp controller=Get.put(OnBoardingControllerImp());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 4,
          child: onBoardingPageView(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      onBoardingController(),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  child: onBoardingControllerButton(),
                ),
                SizedBox(height: 30,)
              ],
            ))
      ],
    )));
  }
}
