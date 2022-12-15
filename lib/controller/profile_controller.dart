import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/datasource/remote/settings/get_users_data.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

abstract class ProfileController extends GetxController {
  getUsersInfo();
}

class ProfileControllerImp extends ProfileController {
  String username = '';
  String email = '';
  String phone = '';
  String address = '';
  statusRequest statusrequest = statusRequest.initialState;
  @override
  void onInit() async {
    await getUsersInfo();
  }

  @override
  getUsersInfo() async {
    statusrequest = statusRequest.loading;
    dio.Response response = await GetUsersInfo_data.getUsersAddress();
    if (jsonDecode(response.data)['status'] == 'success') {
      username = (jsonDecode(response.data)['data']['users_name']);
      print(username);
      email = (jsonDecode(response.data)['data']['users_email']);
      phone = (jsonDecode(response.data)['data']['users_phone']);
      address = (jsonDecode(response.data)['data']['users_address']);
      statusrequest = statusRequest.success;
      print(jsonDecode(response.data)['data']['users_email']);
    } else {
      print(jsonDecode(response.data));

      statusrequest = statusRequest.failure;
    }
    update();
  }
}
