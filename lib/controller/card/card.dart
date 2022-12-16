import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/card/card_data.dart';
import 'package:ecommerce1/data/model/carditemsmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

abstract class CardController extends GetxController {
  getCardItems();
  addOrDeleteAddedCount(CardItemsModel item, int itemCount);
  deleteFromCard({required String cardsItemId});
}

class CardControllerImp extends CardController {
  statusRequest statusrequest = statusRequest.initialState;
  List<CardItemsModel> items = [];

  int itemsCount = 0;

  @override
  void onInit() {}

  @override
  deleteFromCard({required String cardsItemId}) async {
    statusrequest = statusRequest.loading;
    update();
    if (MyServices.sharedPreferences.getInt('cards_number') != null) {
      dio.Response response = await CardData.deleteFromCard(
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);
      if (jsonDecode(response.data)['status'] == 'success') {
        statusrequest = statusRequest.success;
      } else {
        statusrequest = statusRequest.failure;
      }
    } else {
      MyServices.sharedPreferences.setInt('cards_number', 0);
      dio.Response response = await CardData.deleteFromCard(
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);

      if (jsonDecode(response.data)['status'] == 'success') {
        statusrequest = statusRequest.success;
      } else {
        statusrequest = statusRequest.failure;
      }
    }
    getCardItems();
    update();
  }

  @override
  getCardItems() async {
    print(MyServices.sharedPreferences.getString('id'));
    print(MyServices.sharedPreferences.getInt('cards_number'));
    statusrequest = statusRequest.loading;
    items = [];
    itemsCount = 0;
    dio.Response response = await CardData.getCarddata(
        cardsNumber: '${MyServices.sharedPreferences.getInt('cards_number')}',
        cardsUserId: MyServices.sharedPreferences.getString('id')!);
    print(response.data);
    if (jsonDecode(response.data)['status'] == 'success') {
      jsonDecode(response.data)['data'].forEach((element) {
        items.add(CardItemsModel.fromJson(element));
      });
      for (int i = 0; i < items.length; i++) {
        itemsCount = itemsCount + items[i].items_count!;
      }
      update();

      print(itemsCount);
      print(items.length);
      statusrequest = statusRequest.success;
    } else {
      statusrequest = statusRequest.serverFailure;
    }
    print(items);
    update();
  }

  addOrDeleteAddedCount(CardItemsModel item, int itemCount) async {
    dio.Response response = await CardData.updateCard(
        cardsNumber: '${MyServices.sharedPreferences.getInt('cards_number')!}',
        cardsUserId: MyServices.sharedPreferences.getString('id')!,
        cardsItemId: '${item.items_id}',
        cardsItemCount: '${itemCount}');
    update();
  }
}
