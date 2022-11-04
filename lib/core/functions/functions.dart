
import 'dart:io';

// import 'package:ecommerce1/core/class/crud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

validInput(String value,int max,int min,String type){
  if(type=='username'){
    if(!GetUtils.isUsername(value)){
      return 'not valid username';

    }
  }
  if(type=='email'){
    if(!GetUtils.isEmail(value)){
      return 'not valid email';

    }
  }
  if(type=='phone'){
    if(!GetUtils.isPhoneNumber(value)){
      return 'not valid phone';

    }
  }
  if(value.isEmpty){
    return '$type must not be empty';
  }
  if(value.length<min){
    return '$type must not be less than $min';
  }
  if(value.length>max){
    return '$type must not be more than $max';
  }

}
Future<bool> alertExitApp(){

  Get.defaultDialog(
    title: 'Warning!!',
    middleText: 'Do you rely want to exit?',
      actions: [
        ElevatedButton(onPressed: (){
          exit(0);
        }, child:const Text('Yes')),
        ElevatedButton(onPressed: (){
          Get.back();
        }, child:const Text('Cancel')),
      ]
  );
  return Future.value(true);
}
checkInternet ()async{
try{
   var response=await InternetAddress.lookup('google.com');
   if(response.isNotEmpty)
return true;
   else return false;
}
catch(_)
{
  return false;
}

}
// handleRequest(response){
//   if(response==statusRequest){
//     return response;
//   }
//   else{
//     return statusRequest.success;
//   }
// }