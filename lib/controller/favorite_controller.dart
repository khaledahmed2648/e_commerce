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

abstract class FavorateController extends GetxController {
  isFavorite(String itemId, String favorite);
  addToFavorite(String itemId);
  deleteFromFavorite(String itemId);
  fillFavorite(List<ItemsModel> items);
}

class FavoriteControllerImp extends FavorateController {
  List<ItemsModel> favoriteItems = [];

  Map inFavorite = {};
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  statusRequest statusrequest = statusRequest.initialState;
  @override
  void onInit() {
    fillFavorite(homeControllerImp.items);
  }

  @override
  isFavorite(String itemId, String favorite) {
    inFavorite[itemId] = favorite;

    update();
  }

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

  getFavorites() {}
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
      favoriteItems = [];
    }
  }

  @override
  fillFavorite(List<ItemsModel> items) async {
    await fillFavoritesItems();
    inFavorite = {};
    print(items.length);
    for (int i = 0; i < favoriteItems.length; i++) {
      inFavorite['${favoriteItems[i].items_id}'] = '1';
    }
    update();
  }
}
