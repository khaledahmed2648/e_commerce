import 'dart:convert';

import 'package:ecommerce1/controller/card/card.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/card/card_data.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  CardControllerImp cardControllerImp = Get.put(CardControllerImp());
  late ItemsModel itemsModel;
  bool isItemInCard = false;
  int itemCount = 1;
  statusRequest statusrequest = statusRequest.initialState;

  @override
  void onInit() async {
    super.onInit();
    itemsModel = Get.arguments['itemModel'];
    itemsModel.items_count = itemCount;
    dio.Response response = await CardData.getItemFromCarddata(
        cardsNumber: '${MyServices.sharedPreferences.getInt('cards_number')!}',
        cardsUserId: MyServices.sharedPreferences.getString('id')!,
        cardsItemId: '${itemsModel.items_id}');
    if (jsonDecode(response.data)['status'] == 'success') {
      isItemInCard = true;
      itemCount = jsonDecode(response.data)['data'][0]['cards_itemcount'];
      update();
    }
  }

  addAddedCount() async {
    itemCount++;
    dio.Response response = await CardData.updateCard(
        cardsNumber: '${MyServices.sharedPreferences.getInt('cards_number')!}',
        cardsUserId: MyServices.sharedPreferences.getString('id')!,
        cardsItemId: '${itemsModel.items_id}',
        cardsItemCount: '${itemCount}');
    if (jsonDecode(response.data)['status'] == 'success') {
      cardControllerImp.itemsCount = cardControllerImp.itemsCount + 1;
      cardControllerImp.update();
      update();
    }
  }

  addCount() {
    itemCount++;
    itemsModel.items_count = itemCount;
    update();
  }

  minusCount() {
    if (itemCount > 1) {
      itemCount--;
      itemsModel.items_count = itemCount;
    }

    update();
  }

  minusAddedCount() async {
    if (itemCount > 1) {
      itemCount--;

      dio.Response response = await CardData.updateCard(
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: MyServices.sharedPreferences.getString('id')!,
          cardsItemId: '${itemsModel.items_id}',
          cardsItemCount: '${itemCount}');
      if (jsonDecode(response.data)['status'] == 'success') {
        cardControllerImp.itemsCount = cardControllerImp.itemsCount - 1;
        cardControllerImp.update();
        update();
      }
    }
  }

  addOrRemoveFromCard({required String cardsItemId}) {
    if (isItemInCard == false) {
      addtoCard(cardsItemId: cardsItemId);
      cardControllerImp.itemsCount = cardControllerImp.itemsCount + itemCount;
      Get.snackbar('Done', 'Product have been added successfully');
    } else {
      deleteFromCard(cardsItemId: cardsItemId);
      cardControllerImp.itemsCount = cardControllerImp.itemsCount - itemCount;
      itemCount = 1;

      Get.snackbar('Done', 'Product have been deleted successfully');
    }
    cardControllerImp.update();
    update();
  }

  addtoCard({required String cardsItemId}) async {
    statusrequest = statusRequest.loading;
    update();
    if (MyServices.sharedPreferences.getInt('cards_number') != null) {
      dio.Response response = await CardData.addToCard(
          cardsitemcount: '$itemCount',
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);
      print(response.data);
      print('add 1');
      if (jsonDecode(response.data)['status'] == 'success') {
        print(response.data);
        statusrequest = statusRequest.success;
        isItemInCard = true;
      } else {
        statusrequest = statusRequest.failure;
        print('add 1');
      }
    } else {
      MyServices.sharedPreferences.setInt('cards_number', 0);
      dio.Response response = await CardData.addToCard(
          cardsitemcount: '$itemCount',
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);
      print(response.data);

      if (jsonDecode(response.data)['status'] == 'success') {
        statusrequest = statusRequest.success;
        isItemInCard = true;
        print(response.data);
      } else {
        statusrequest = statusRequest.failure;
        print('add 0');
      }
    }
    update();
  }

  deleteFromCard({required String cardsItemId}) async {
    statusrequest = statusRequest.loading;
    update();
    if (MyServices.sharedPreferences.getInt('cards_number') != null) {
      print('${MyServices.sharedPreferences.getInt('cards_number')}');
      dio.Response response = await CardData.deleteFromCard(
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);
      print(response.data);

      if (jsonDecode(response.data)['status'] == 'success') {
        statusrequest = statusRequest.success;
        isItemInCard = false;
        print(response.data);
      } else {
        statusrequest = statusRequest.failure;
        print('delete 1');
      }
    } else {
      MyServices.sharedPreferences.setInt('cards_number', 0);
      dio.Response response = await CardData.deleteFromCard(
          cardsNumber:
              '${MyServices.sharedPreferences.getInt('cards_number')!}',
          cardsUserId: '${MyServices.sharedPreferences.getString('id')}',
          cardsItemId: cardsItemId);
      print(response.data);

      if (jsonDecode(response.data)['status'] == 'success') {
        statusrequest = statusRequest.success;
        isItemInCard = false;
        print(response.data);
      } else {
        statusrequest = statusRequest.failure;
        print('delete 0');
      }
    }
    update();
  }
}
