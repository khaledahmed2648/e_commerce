import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/Auth/login.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:dio/dio.dart'as dio;

class ResetPassData{

  static postCheckData({required String email,required String password})async{
   var response=await Crud.postData(ApiLink.resetPassForget, {
      'users_email':email,
     'users_password':password
    });
   return response;
  }
}