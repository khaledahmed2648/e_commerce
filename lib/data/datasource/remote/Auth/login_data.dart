import 'package:ecommerce1/LinkAPI.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce1/core/class/crud.dart';

class LoginData{

 static postLoginData({required String email,required String password})async{
    var response=await Crud.postData(ApiLink.login,{
    'users_password':password,
    'users_email':email,
    });
    return response;
  }
}