import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/card/card.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/view/screens/settingsscreen.dart';
import 'package:ecommerce1/view/widgets/home/costumappbarhome.dart';
import 'package:ecommerce1/view/widgets/home/costumcardhome.dart';
import 'package:ecommerce1/view/widgets/home/customtitlehome.dart';
import 'package:ecommerce1/view/widgets/home/listitemshome.dart';
import 'package:ecommerce1/view/widgets/items/new_items_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/home/home_controller.dart';
import '../../controller/favorite_controller.dart';
import '../../core/constant/routes.dart';
import '../../core/services/services.dart';
import '../widgets/home/listcategorieshome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favorateController = Get.put(FavoriteControllerImp());
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              CostumAppBarHome(
                  onPressedFavorite: () {
                    controller.goToFavorites();
                  },
                  onPressedSettings: () {
                    Get.to(Settings());
                    print(MyServices.sharedPreferences.getString('id'));
                  },
                  hintText: 'Find your product'),
              const SizedBox(
                height: 20,
              ),
              CostumCardHome(
                  mainText: 'New offers', secondaryText: 'Big Discounts'),

              const SizedBox(
                height: 20,
              ),

              CustomTitleHome(title: 'Categories'),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ListCategoriesHome(
                          categories: controller.categories[index],
                          onTap: () {
                            controller.goToItems(index);
                          },
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: controller.categories.length),
              ),
              CustomTitleHome(title: 'Offers'),
              const SizedBox(
                height: 10,
              ),
              NewItemsList(items: controller.items),
              const SizedBox(
                height: 10,
              ),
              CustomTitleHome(title: 'Products for you'),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.1),
                  itemBuilder: (context, index) {
                    // favorateController
                    //         .inFavorite[controller.items[index].items_id] =
                    //     '${controller.items[index].favorite}';
                    // print(favorateController.inFavorite);
                    return ListItemsHome(items: controller.items[index]);
                  },
                  itemCount: controller.items.length),
              //CustomTitleHome(title: 'Offers'),
              // SizedBox(
              //   height: 170,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) =>
              //           ListItemsHome(items: controller.items[index]),
              //       separatorBuilder: (context, index) => const SizedBox(
              //             width: 15,
              //           ),
              //       itemCount: controller.items.length),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
