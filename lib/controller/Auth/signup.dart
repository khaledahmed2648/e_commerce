import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/data/datasource/remote/Auth/signup_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;

import '../../core/constant/routes.dart';
abstract class SignUpController extends GetxController{
  getToLogin();
  changePassState();
  postSignupData();
}
class SignUpControllerImp extends SignUpController{
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  static late String emailargument;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  SignupData signupData=Get.put(SignupData());
  bool isPassHidden =true;
   statusRequest statusrequest=statusRequest.initialState;
  @override
  postSignupData()async{
   if(await checkInternet()){
     try{

       statusrequest=statusRequest.loading;
       update();
       dio.Response response=await signupData.postSignupData(email: email.text, password: password.text, name: name.text, phone: phone.text);
       print('-=================done ======================');
       print(response.data);
       if(jsonDecode(response.data)['status']=='success'){
         print('-=================done two ======================');
         emailargument=email.text;
         statusrequest=statusRequest.success;
       }
       else{
         print('-=================done two ======================');

         statusrequest=statusRequest.failure;


       }
     }catch(e){
       print(e);
       statusrequest=statusRequest.serverFailure;

     }
}else{
     statusrequest=statusRequest.offlineFailure;

   }
   update();
  }


  @override
  changePassState(){
    isPassHidden!=isPassHidden;
    update();
  }


  @override
  void onInit() {
    name=TextEditingController();
    email=TextEditingController();
    password=TextEditingController();
    phone=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
   name.dispose();
   email.dispose();
   phone.dispose();
   password.dispose();
    super.dispose();
  }
  @override
  getToLogin() {
    Get.offNamed(AppRoutes.login);
     }



}

