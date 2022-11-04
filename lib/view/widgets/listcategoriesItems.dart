import 'package:ecommerce1/controller/itemscontroller.dart';
import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';

import '../../../LinkAPI.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  void Function()? onTap;
  int catNumber;
CategoriesModel categories;
ListCategoriesItems({required this.onTap,required this.categories,required this.catNumber});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller)=> InkWell(
        onTap:onTap ,
        child: Column(
          children: [
            Container(
            margin:const EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(bottom: 8),
              decoration:controller.catNumber==catNumber?BoxDecoration(
                  border:Border(
                    bottom: BorderSide(color:AppColors.mainColor,width: 3)
                  )
              ):null,
              child: Text(

                '${categories.categories_name}',
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
