import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/view/widgets/items/listcategoriesItems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce1/view/widgets/items/listitemsItems.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/items/itemscontroller.dart';
import '../widgets/home/costumappbarhome.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CostumAppBarHome(
                  onPressedNotification: () {}, hintText: 'Find your products'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ListCategoriesItems(
                      onTap: ()async {
                        controller.changeCategory(index);
                      await controller.getItems(controller.categories[index].categories_id!);
                      },
                      categories: controller.categories[index],
                      catNumber: index),
                  itemCount: controller.categories.length,
                ),
              ),
              ListItemsItems()
            ],
          ),
        ),
      ),
    );
  }
}
