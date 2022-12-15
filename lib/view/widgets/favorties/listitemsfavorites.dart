import 'package:ecommerce1/controller/favorites_screen_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../LinkAPI.dart';
import '../../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../controller/favorite_controller.dart';
import '../../../controller/items/itemscontroller.dart';

class ListItemsFavorites extends GetView<ItemsControllerImp> {
  const ListItemsFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesScreenControllerImp());
    return GetBuilder<FavoritesScreenControllerImp>(builder: (favController) {
      if (favController.statusrequest == statusRequest.success) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: .69),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.gotoItemDetails(favController.favoriteItems[index]);
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: '${favController.favoriteItems[index].items_id}',
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiLink.itemsImages}${favController.favoriteItems[index].items_image}',
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      '${favController.favoriteItems[index].items_name}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${favController.favoriteItems[index].items_desc}',
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
                            '${favController.favoriteItems[index].items_price}',
                            style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                favController.deleteFromFavorite(
                                    '${favController.favoriteItems[index].items_id!}');
                              },
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: favController.favoriteItems.length,
        );
      } else {
        print('error');
        return Container();
      }
    });
  }
}
