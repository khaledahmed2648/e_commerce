import 'package:ecommerce1/bindings/initialBinding.dart';
import 'package:ecommerce1/core/localization/translation.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/changelange.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
        locale: controller.language,
        theme: controller.appTheme,
        getPages: routes,
        initialBinding: InitialBindings(),
    );
  }
}

