import 'package:ecommerce1/LinkAPI.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce1/core/class/crud.dart';

class VerifyCodeSignupData{

 static postSignupData({required String apiLink,required String email,required String verifyCode})async{
    var response=await Crud.postData(apiLink,{
    'email':email,
    'verifyCode':verifyCode
    });
    return response;
  }
}