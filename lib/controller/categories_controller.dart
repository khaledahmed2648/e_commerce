import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/datasource/remote/settings/get_users_data.dart';
import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

abstract class CategoriesController extends GetxController {
  getUsersInfo();
}

class CategoriesControllerImp extends CategoriesController {
  List<CategoriesModel> categoriesModel = [];
  statusRequest statusrequest = statusRequest.initialState;
  @override
  void onInit() async {
    await getUsersInfo();
  }

  @override
  getUsersInfo() async {
    statusrequest = statusRequest.loading;
    dio.Response response = await GetUsersInfo_data.getCategories();
    if (jsonDecode(response.data)['status'] == 'success') {
      jsonDecode(response.data)['categories'].forEach((element) {
        categoriesModel.add(CategoriesModel.fromJson(element));
      });
      statusrequest = statusRequest.success;
      // print(jsonDecode(response.data)['data']['users_email']);
    } else {
      print(jsonDecode(response.data));

      statusrequest = statusRequest.failure;
    }
    update();
  }
}
