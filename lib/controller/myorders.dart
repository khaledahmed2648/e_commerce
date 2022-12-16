import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/datasource/remote/bill/bill_data.dart';
import 'package:ecommerce1/data/model/myorder_data.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../data/datasource/remote/settings/get_users_data.dart';

abstract class MyOrdersController extends GetxController {
  getMyOrders();
}

class MyOrdersControllerImp extends MyOrdersController {
  statusRequest statusrequest = statusRequest.initialState;
  List<MyOrdersModel> ordersmodel = [];
  @override
  void onInit() {
    getMyOrders();
  }

  @override
  getMyOrders() async {
    statusrequest = statusRequest.loading;
    update();
    dio.Response response = await BillData.getBill();
    print(jsonDecode(response.data));

    if (jsonDecode(response.data)['status'] == 'success') {
      jsonDecode(response.data)['data'].forEach((element) {
        ordersmodel.add(MyOrdersModel.fromJson(element));
      });

      statusrequest = statusRequest.success;
      update();

      print(jsonDecode(response.data)['data']);
    } else {
      print(jsonDecode(response.data));

      statusrequest = statusRequest.failure;
    }
    print(response.data);
    update();
  }
}
