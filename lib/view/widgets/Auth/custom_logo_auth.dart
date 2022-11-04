import 'package:ecommerce1/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logoImage,height: 100,width: 150,);

  }
}
