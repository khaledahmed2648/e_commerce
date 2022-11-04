import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/data/datasource/remote/forgetpassword/checkemailforget_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'as dio;

import '../../core/constant/routes.dart';
abstract class ForgetPassController extends GetxController{
  checkEmail();

}
class ForgetPassControllerImp extends ForgetPassController{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
statusRequest statusrequest=statusRequest.initialState;
static late String emailArgument;
  late TextEditingController email;
  @override
  checkEmail() async{
    statusrequest=statusRequest.loading;
    update();
    if(await checkInternet()){
      try{
        dio.Response response=await CheckEmailForgetPass.postCheckData(email: email.text);
        print(response);
        if(jsonDecode(response.data)['status']=='success'){
          emailArgument=email.text;
          statusrequest=statusRequest.success;
          print('====================success===================');
        }else{
          statusrequest=statusRequest.failure;
          print('====================failure===================');

        }
      }catch(e){
        statusrequest=statusRequest.serverFailure;
        print(e);
        print('====================serverFailure===================');

      }
    }else{
      statusrequest=statusRequest.offlineFailure;
      print('====================offlineFailure===================');

    }
    update();
    }
    @override
  void onInit() {
      email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {

    email.dispose();
    super.dispose();
  }

}

