import 'package:ecommerce1/controller/onBoardingController.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';
import '../../screens/home.dart';
OnBoardingControllerImp controller =Get.put(OnBoardingControllerImp());
Widget onBoardingPageView(){
  return GetBuilder<OnBoardingControllerImp>(
      builder:(controller)=>PageView.builder(
        controller: controller.pageController,
        onPageChanged: (index){
          controller.currentPage=index;
          controller.update();
        },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            '${onBoardingList[index].title}',
            style:Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            '${onBoardingList[index].image}',
            height: 250,
            width: 200,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              '${onBoardingList[index].body}',
              style:Theme.of(context).textTheme.bodyText1 ,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ))
  );

}

Widget onBoardingController(){

  return GetBuilder<OnBoardingControllerImp>(
    builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ...List.generate(
          onBoardingList.length,
              (index) => AnimatedContainer(
            duration: Duration(milliseconds: 900),
            margin: const EdgeInsets.only(right: 5),
            height: 6,
            width:controller.currentPage==index? 25:12,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ))],);
    }
  );
}

Widget onBoardingControllerButton()=>MaterialButton(
    child: Text('continue'.tr,style: TextStyle(color: Colors.white),),
    onPressed: () {
      if(controller.currentPage<onBoardingList.length-1){
        controller.next();
      }
      else{
        MyServices.sharedPreferences.setBool('onBoarding', true);
        Get.offAllNamed(AppRoutes.login);
      }
    },
    color: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 90,),

);