import 'dart:convert';

import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/datasource/remote/home_data.dart';
import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
abstract class HomeController extends GetxController{
  getHomeData();
  goToItems(int catNumber,);
}
class HomeControllerImp extends HomeController{
  statusRequest statusrequest=statusRequest.initialState;
  String? username;
  List<CategoriesModel> categories=[];
  List<ItemsModel>items=[];
  @override
  void onInit()async {

    username=MyServices.sharedPreferences.getString('username');
    await getHomeData();
    super.onInit();

  }
  @override
  getHomeData()async{
print('helleo');
    statusrequest=statusRequest.loading;
    update();
    print('hello');
    dio.Response response=await HomeData.getHomeData();
print('-=================done ======================');

    if(jsonDecode(response.data)['status']=='success'){
      jsonDecode(response.data)['categories'].forEach((element) {
        categories.add(CategoriesModel.fromJson(element));
      });
      jsonDecode(response.data)['items'].forEach((element) {
        items.add(ItemsModel.fromJson(element));
      });

      statusrequest=statusRequest.success;
    print(items);
    }
    else{
      print('-=================done two ======================');

      statusrequest=statusRequest.failure;


    }

  update();
}

  @override
  goToItems(int catNumber) {
  Get.toNamed(AppRoutes.items,arguments: {
    'categories': categories,
    'catNumber': catNumber
  });
   }
  }




