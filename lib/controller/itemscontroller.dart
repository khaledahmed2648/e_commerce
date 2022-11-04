import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;

import '../data/datasource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  changeCategory(int i);
  getItems();
  initialData();
}

class ItemsControllerImp extends ItemsController {
   int catNumber=0;
   statusRequest statusrequest=statusRequest.initialState;

   List<CategoriesModel> categories=[];
   List<ItemsModel>items=[];

  @override
  changeCategory(int i) {
    catNumber = i;
    update();
  }

  @override
  initialData()async{
    categories=Get.arguments['categories'];
    catNumber=Get.arguments['catNumber'];
    await getItems();
  }
  @override
  void onInit()async {
   await initialData();
  }
  
  @override
  getItems()async {
  statusrequest=statusRequest.loading;
  dio.Response response=await ItemsData.getItemsData();
  if(jsonDecode(response.data)['status']=='success'){
    jsonDecode(response.data)['data'].forEach((element){
      items.add(ItemsModel.fromJson(element));
    });
    statusrequest=statusRequest.success;
    print(items);
  }
  else{
    statusrequest=statusRequest.serverFailure;
  }
  }
}
