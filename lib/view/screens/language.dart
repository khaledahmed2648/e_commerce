import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/localization/changelange.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/languageWidgets.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: Text("chooseLange".tr,style:Theme.of(context).textTheme.headline1,),),
         const SizedBox(height: 10,),
          customButtonLang(textButton: 'arLang'.tr, onPressed: (){
            this.
            controller.changeLang('ar');
            Get.offAllNamed(AppRoutes.onBoarding);

          }),
           customButtonLang(textButton: 'enLang'.tr, onPressed: (){
            controller.changeLang('en');
            Get.offAllNamed(AppRoutes.onBoarding);
          })
        ],
      ),
    );
  }
}
