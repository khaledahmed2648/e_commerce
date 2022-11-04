import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/home_controller.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/view/widgets/home/costumappbarhome.dart';
import 'package:ecommerce1/view/widgets/home/costumcardhome.dart';
import 'package:ecommerce1/view/widgets/home/customtitlehome.dart';
import 'package:ecommerce1/view/widgets/home/listitemshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/home/listcategorieshome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
          builder: (controller) => ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                 CostumAppBarHome(onPressedNotification: (){}, hintText: 'Find your product'),
                    const SizedBox(
                      height: 20,
                    ),
                    CostumCardHome(mainText: 'New offers', secondaryText: 'Big Discounts'),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTitleHome(title: 'Categories'),
                    Container(
                      height: 100,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>ListCategoriesHome(categories:controller.categories[index],onTap: (){
                            controller.goToItems(index);
                          },),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 20,
                              ),
                          itemCount: controller.categories.length),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTitleHome(title: 'Products for you'),
                    SizedBox(
                      height: 170,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ListItemsHome(items: controller.items[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: controller.items.length),
                    ),
                    CustomTitleHome(title: 'Offers'),
                    SizedBox(
                      height: 170,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ListItemsHome(items: controller.items[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: controller.items.length),
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
}
