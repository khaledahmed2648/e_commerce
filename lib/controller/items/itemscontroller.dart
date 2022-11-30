import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;

import '../../data/datasource/remote/items_data.dart';


abstract class ItemsController extends GetxController {
  changeCategory(int i);
  getItems(int categoryId);
  gotoItemDetails(ItemsModel itemsModel);
  initialData();
}

class ItemsControllerImp extends ItemsController {
   int catNumber=0;
   int categoryId=0;
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
    categoryId=categories[catNumber].categories_id!;
    await getItems(categoryId);
  }
  @override
  void onInit()async {
   await initialData();
  }
  
  @override
  getItems(categoryId)async {
  statusrequest=statusRequest.loading;
  items=[];
  dio.Response response=await ItemsData.getItemsData(categoryId.toString(),MyServices.sharedPreferences.getString('id')!);
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
  update();
  }
  
  @override
  gotoItemDetails(ItemsModel itemsModel) {
  Get.toNamed(AppRoutes.itemdetails,arguments: {
    'itemModel':itemsModel
  });
  }
}
