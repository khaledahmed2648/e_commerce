import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../LinkAPI.dart';
import '../../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/items/itemscontroller.dart';

class ListItemsItems extends GetView<ItemsControllerImp> {
  const ListItemsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    FavoriteControllerImp favoriteControllerImp =
        Get.put(FavoriteControllerImp());
    favoriteControllerImp.fillFavorite(controller.items);
    if (controller.statusrequest == statusRequest.success) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .69),
        itemBuilder: (context, index) {
          return InkWell(
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
                        const Text(
                          'Rating : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 14,
                                ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        GetBuilder<FavoriteControllerImp>(
                            builder: (favController) {
                          return IconButton(
                              onPressed: () async {
                                // favController.inFavorite = {};
                                //print(controller.items[index].favorite);
                                print(favController.inFavorite);
                                // print(favController.inFavorite[
                                //     controller.items[index].items_id]);

                                if (favController.inFavorite[
                                        '${controller.items[index].items_id}'] ==
                                    null) {
                                  await favController.addToFavorite(
                                      '${controller.items[index].items_id}');
                                  if (favController.statusrequest ==
                                      statusRequest.success) {
                                    favController.isFavorite(
                                        '${controller.items[index].items_id}',
                                        '1');
                                    Get.rawSnackbar(
                                        title: 'Notification',
                                        messageText: const Text(
                                          'Item was added to favorites successfully',
                                          style: TextStyle(color: Colors.white),
                                        ));
                                  }
                                } else {
                                  await favController.deleteFromFavorite(
                                      '${controller.items[index].items_id}');
                                  if (favController.statusrequest ==
                                      statusRequest.success) {
                                    favController.isFavorite(
                                        '${controller.items[index].items_id}',
                                        '0');
                                    Get.rawSnackbar(
                                        title: 'Notification',
                                        messageText: const Text(
                                            'Item was deleted from favorite successfully'));
                                  }
                                  controller.update();
                                }
                              },
                              icon: Icon(
                                favController.inFavorite[
                                            '${controller.items[index].items_id}'] ==
                                        null
                                    ? Icons.favorite_border_outlined
                                    : Icons.favorite,
                                color: Colors.red,
                              ));
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: controller.items.length,
      );
    } else {
      return Container();
    }
  }
}
