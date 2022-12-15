import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';

class GetUsersInfo_data {
  static getUsersAddress() async {
    var response = await Crud.getData(ApiLink.getusersinfo,
        {'users_id': MyServices.sharedPreferences.getString('id')});
    return response;
  }

  static getCategories() async {
    var response = await Crud.getData(ApiLink.categories, {});
    return response;
  }

  static updateAddress({required String users_address}) async {
    var response = await Crud.postData(ApiLink.update_address, {
      'users_id': MyServices.sharedPreferences.getString('id'),
      'users_address': users_address
    });
    return response;
  }
}
