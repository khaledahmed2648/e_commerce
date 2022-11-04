import 'dart:convert';

import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/Auth/signup.dart';
import 'package:ecommerce1/controller/forgetpassword/forgetPassword.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/datasource/remote/Auth/verifyCodeSignup_data.dart';
import 'package:get/get.dart';
import '../../core/functions/functions.dart';
import 'package:dio/dio.dart'as dio;
abstract class VerificationForgetController extends GetxController{
  checkEmail();
  goToResetPass({required String verifyCode});
}
class VerificationForgetControllerImp extends VerificationForgetController{
static late String email;
   statusRequest statusrequest=statusRequest.initialState;
  @override
  goToResetPass({required String verifyCode})async {
    if(await checkInternet()){


    statusrequest=statusRequest.loading;
    update();
    dio.Response response=await VerifyCodeSignupData.postSignupData(apiLink: ApiLink.verifyCodeForgetPass,email: email,verifyCode: verifyCode);
    print('-=================done ======================');
    print(response.data);
    print(email);
    if(jsonDecode(response.data)['status']=='success'){

    print('-=================done two ======================');

    statusrequest=statusRequest.success;
    }
    else if(jsonDecode(response.data)['status']=='failure'){
      print('-=================done two ======================');

      statusrequest=statusRequest.failure;


    }  else {
      print('-=================done two ======================');

      statusrequest=statusRequest.serverFailure;



    }}else{
    statusrequest=statusRequest.offlineFailure;

    }
    update();
  }

  @override
  checkEmail() {
    }
    @override
  void onInit() {
       email=ForgetPassControllerImp.emailArgument;
       print('=================$email==============');

  }
}

