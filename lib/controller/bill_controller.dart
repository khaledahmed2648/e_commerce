import 'dart:convert';

import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/bill/bill_data.dart';
import 'package:ecommerce1/data/datasource/remote/settings/get_users_data.dart';
import 'package:ecommerce1/data/datasource/remote/bill/update_bills_data.dart';
import 'package:ecommerce1/data/model/carditemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

abstract class BillController extends GetxController {
  addtobill();
  getaddress();
  updateAddress({required String address});
  confirmbill();
}

class BillControllerImp extends BillController {
  var cityController = TextEditingController();
  var regionController = TextEditingController();
  var streetController = TextEditingController();
  var buildingController = TextEditingController();
  var apartmentController = TextEditingController();

  statusRequest statusrequest = statusRequest.initialState;
  List<CardItemsModel> items = [];
  List<int> itemPrice = [];
  late double itemsSalary = 0;
  Map bills_itemsid_and_count = {};
  int bills_id = 0;
  int bills_dilivary_salary = 50;
  String bills_time = '';
  double totalSalary = 0;
  List<String>? addressInfo;
  @override
  getaddress() async {
    dio.Response response = await GetUsersInfo_data.getUsersAddress();
    print(jsonDecode(response.data)['data']['users_address']);
    if (jsonDecode(response.data)['data']['users_address'] != '') {
      addressInfo = jsonDecode(response.data)['data']['users_address']
          .toString()
          .split('/');
      print(addressInfo);
      cityController.text = addressInfo![0];
      regionController.text = addressInfo![1];
      streetController.text = addressInfo![2];
      buildingController.text = addressInfo![3];
      apartmentController.text = addressInfo![4];
    }
    update();
  }

  @override
  addtobill() async {
    dio.Response response = await BillData.addToBill(
        bills_items_salary: '$itemsSalary!',
        bills_dilivary_salary: '$bills_dilivary_salary',
        bills_itemsid_and_count: '${bills_itemsid_and_count}');
    print(response);
    if (jsonDecode(response.data)['status'] == 'success') {
      bills_id = jsonDecode(response.data)['data']['bills_id'];
      bills_time = jsonDecode(response.data)['data']['bills_time'];
      bills_time = jsonDecode(response.data)['data']['bills_time'];
      statusrequest = statusRequest.success;
    } else {
      statusrequest = statusRequest.failure;
    }
  }

  @override
  void onInit() async {
    statusrequest = statusRequest.loading;
    items = Get.arguments['items'];
    for (int i = 0; i < items.length; i++) {
      itemsSalary = itemsSalary + items[i].items_price!;
      itemPrice.add(items[i].items_price! * items[i].items_count!);
      bills_itemsid_and_count['${items[i].items_id}'] =
          '${items[i].items_count}';
    }
    totalSalary = itemsSalary + bills_dilivary_salary;
    await getaddress();
    await addtobill();
    update();
  }

  @override
  updateAddress({required String address}) async {
    dio.Response response =
        await GetUsersInfo_data.updateAddress(users_address: address);
    if (jsonDecode(response.data)['status'] == 'success') {
      Get.snackbar('Success Addressing', 'Your address updated successfully');
      await getaddress();
    } else {
      Get.snackbar('Error while Addressing', 'Please check your internet');
    }
  }

  @override
  confirmbill() async {
    dio.Response response =
        await UpdateBillsData.updateBillConfirmation(bills_id: '$bills_id');
    if (jsonDecode(response.data)['status'] == 'success') {
      MyServices.sharedPreferences.setInt('cards_number',
          MyServices.sharedPreferences.getInt('cards_number')! + 1);
      Get.offNamed(AppRoutes.successorder);
    }
  }
}
