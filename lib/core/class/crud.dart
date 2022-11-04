import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:dio/dio.dart';
class  Crud {
static Dio dio=Dio();
  // static postRequest({required String url, required Map<String, dynamic> data}) async {
  //   http.Response response=  await http.post(Uri.parse(url), body: data);
  //   if (response.statusCode == 200) {
  //     var responseBody = jsonDecode(response.body);
  //     print('================================================');
  //     print(response.body);
  //     print('================================================');
  //     print(response.headers);
  //
  //     return responseBody;
  //   } else
  //     print('${response.statusCode}');
  //   print('================================================');
  //   print(response.body);
  //   print('================================================');
  //   print(response.headers);
  //
  // }

static postData(String url,Map<String,dynamic> data)async{

  var response=await dio.post(url,queryParameters: data);
  return response;
}
static getData(String url,Map<String,dynamic> data)async{

  var response=await dio.get(url,queryParameters: data);
  return response;
}
}
enum statusRequest{
  loading,
  success,
  serverFailure,
  offlineFailure,
  failure,
  initialState
}