import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/Auth/login_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'as dio;
import '../../core/constant/routes.dart';
import '../../core/functions/functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
abstract class LoginController extends GetxController{
  login();
  getToSignUp();
  getToForgetPass();
  changePassState();
  postLogin();
}
class LoginControllerImp extends LoginController{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  statusRequest statusrequest=statusRequest.initialState;
  bool isPassHidden =true;
  @override
  changePassState(){
    isPassHidden=!isPassHidden;
    update();
  }
  @override
  postLogin()async{
    if(await checkInternet()){


        statusrequest=statusRequest.loading;
        update();
        dio.Response response=await LoginData.postLoginData(email: email.text, password: password.text);
        print('-=================done ======================');
        print(response.data);
        if(jsonDecode(response.data)['status']=='success'){
          print(jsonDecode(response.data)['data']);
          MyServices.sharedPreferences.setString('id',(jsonDecode(response.data)['data']['users_id'].toString()));
          MyServices.sharedPreferences.setString('username', jsonDecode(response.data)['data']['users_name']);
          MyServices.sharedPreferences.setString('email', jsonDecode(response.data)['data']['users_email']);
          MyServices.sharedPreferences.setString('phone',jsonDecode(response.data)['data']['users_phone']);
          print(jsonDecode(response.data)['data']['users_name']);
          statusrequest=statusRequest.success;
        }
        else{
          print('-=================done two ======================');

          statusrequest=statusRequest.failure;


      }
    }else{
      statusrequest=statusRequest.offlineFailure;

    }
    update();
  }
  @override
  getToSignUp() {
    Get.offNamed(AppRoutes.signUp);
    }
    @override
  getToForgetPass() {
    Get.toNamed(AppRoutes.forgetPass);
  }

  @override
  login() {
    }
    @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print('token is : $value');
    });
      email=TextEditingController();
      password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {

    email.dispose();
    password.dispose();
    super.dispose();
  }

}

