import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/card/card.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/addtocrardbuttonitem.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/customcolorItemdetails.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/customcontentitemsdetails.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/customtitleitemsdetails.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/priceandcountitem.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items/itemdetails_controller.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
    double? discount;
    return GetBuilder<ItemDetailsControllerImp>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              width: double.infinity,
              child: AddToCardButtonItemOrBuy(
                onTap: () async {
                  await controller.addOrRemoveFromCard(
                      cardsItemId: '${controller.itemsModel.items_id!}');
                },
                text: controller.isItemInCard
                    ? 'Delete from cart'
                    : 'Add to cart',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,
              child: AddToCardButtonItemOrBuy(
                  onTap: () async {
                    Get.toNamed(AppRoutes.billoneitemdetails,
                        arguments: {'item': controller.itemsModel});
                  },
                  text: 'Buy now'),
            ),
          ],
        ),
        body: ListView(children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                  height: 250,
                  child: Hero(
                      tag: '${controller.itemsModel.items_id}',
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiLink.itemsImages}${controller.itemsModel.items_image}',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ))),
            ],
          ),
          PriceAndCountItemDetails(
              price: controller.itemsModel.items_price!,
              itemsDiscount: controller.itemsModel.items_discound,
              onAdd: () async {
                if (controller.isItemInCard) {
                  await controller.addAddedCount();
                } else {
                  controller.addCount();
                }
              },
              onSub: () async {
                if (controller.isItemInCard) {
                  await controller.minusAddedCount();
                } else {
                  controller.minusCount();
                }
              },
              count: '${controller.itemCount}'),
          CustomTitleItemDetails(
            title: '${controller.itemsModel.items_name}',
          ),
          CustomContentItemDetails(
              content: '${controller.itemsModel.items_desc}'),
          CustomTitleItemDetails(title: 'Color'),
          Row(
            children: [
              CustomColorItemDetails(
                  title: 'blue',
                  textColor: Colors.white,
                  containerColor: AppColors.mainColor),
              CustomColorItemDetails(
                  title: 'black',
                  textColor: Colors.black,
                  containerColor: Colors.white),
              CustomColorItemDetails(
                  title: 'red',
                  textColor: Colors.black,
                  containerColor: Colors.white),
            ],
          )
        ]),
      );
    });
  }
}
