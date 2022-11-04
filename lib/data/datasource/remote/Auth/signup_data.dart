import 'package:ecommerce1/LinkAPI.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce1/core/class/crud.dart';

class SignupData{

  postSignupData({required String email,required String password,required String name,required String phone})async{
    var response=await Crud.postData(ApiLink.signUp,{
    'users_name':name,
    'users_password':password,
    'users_email':email,
    'users_phone':phone
    });
    return response;
  }
}