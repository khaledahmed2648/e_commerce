import 'package:ecommerce1/controller/test_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestConteroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),

    );
  }
}
