import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/Auth/login.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:dio/dio.dart'as dio;

class CheckEmailForgetPass{

  static postCheckData({required String email})async{
   var response=await Crud.postData(ApiLink.checkEmailForgetPass, {
      'email':email
    });
   return response;
  }
}