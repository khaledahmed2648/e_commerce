import 'dart:convert';

import 'package:ecommerce1/controller/forgetpassword/verificationcodeforget.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/datasource/remote/forgetpassword/resetPassword_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'as dio;
import '../../core/constant/routes.dart';
import '../../core/functions/functions.dart';
abstract class ResetPasswordController extends GetxController{
  checkPassword({required String pass});
  goToSignInSuccess();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  statusRequest statusrequest=statusRequest.initialState;
  @override
  goToSignInSuccess() {
    Get.toNamed(AppRoutes.successResetPass);
    }

  @override
  checkPassword({required String pass})async {
    statusrequest=statusRequest.loading;
    update();
    if(await checkInternet()){
      try{
        dio.Response response=await ResetPassData.postCheckData(password:pass,email: VerificationForgetControllerImp.email);
        print(response);
        print(VerificationForgetControllerImp.email);
        if(jsonDecode(response.data)['status']=='success'){
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
      password=TextEditingController();
      rePassword=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {

    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

}

