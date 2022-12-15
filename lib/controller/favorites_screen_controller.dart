import 'dart:convert';

import 'package:ecommerce1/controller/home/home_controller.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/favorites_data.dart';
import 'package:ecommerce1/data/model/favoritesmodel.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import "package:get/get.dart";
import 'package:dio/dio.dart' as dio;

import '../core/class/crud.dart';
import 'items/itemscontroller.dart';

abstract class FavoritesScreenController extends GetxController {
  fillFavoritesItems();
  deleteFromFavorite(String itemId);
}

class FavoritesScreenControllerImp extends FavoritesScreenController {
  List<ItemsModel> favoriteItems = [];

  statusRequest statusrequest = statusRequest.initialState;
  @override
  void onInit() {
    fillFavoritesItems();
  }

  @override
  @override
  addToFavorite(String itemId) async {
    statusrequest = statusRequest.loading;
    dio.Response response = await FavoritesData.addToFavorites(
        MyServices.sharedPreferences.getString('id')!, itemId);
    if (jsonDecode(response.data)['status'] == 'success') {
      statusrequest = statusRequest.success;
    } else {
      statusrequest = statusRequest.serverFailure;
    }
    update();
  }

  @override
  deleteFromFavorite(String itemId) async {
    statusrequest = statusRequest.loading;
    dio.Response response = await FavoritesData.deleteFromFavorites(
        MyServices.sharedPreferences.getString('id')!, itemId);
    print(response.statusCode);
    print((response.data));

    if (jsonDecode(response.data)['status'] == 'success') {
      statusrequest = statusRequest.success;
      fillFavoritesItems();
    } else {
      statusrequest = statusRequest.serverFailure;
    }
    update();
  }

  fillFavoritesItems() async {
    favoriteItems = [];
    statusrequest = statusRequest.loading;
    dio.Response response = await FavoritesData.getFavorties(
        '${MyServices.sharedPreferences.getString('id')}');
    if (jsonDecode(response.data)['status'] == 'success') {
      jsonDecode(response.data)['data'].forEach((elemet) {
        favoriteItems.add(ItemsModel.fromJson(elemet));
      });
      statusrequest = statusRequest.success;
      print(favoriteItems.length);
    } else {
      print('error');

      favoriteItems = [];
    }
    update();
  }
}
