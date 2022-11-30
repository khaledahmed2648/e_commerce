import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../LinkAPI.dart';
import '../../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemscontroller.dart';

class ListItemsItems extends GetView<ItemsControllerImp> {
  ListItemsItems();

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    if (controller.statusrequest == statusRequest.success) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .69),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.gotoItemDetails(controller.items[index]);
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: '${controller.items[index].items_id}',
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiLink.itemsImages}${controller.items[index].items_image}',
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  '${controller.items[index].items_name}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${controller.items[index].items_desc}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Rating: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                size: 14,
                              ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '${controller.items[index].items_price}',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(controller.items[index].favorite == '0'
                              ? Icons.favorite_outline
                              : Icons.favorite
                          ,color: Colors.red,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: controller.items.length,
      );
    } else {
      return Container();
    }
  }
}
