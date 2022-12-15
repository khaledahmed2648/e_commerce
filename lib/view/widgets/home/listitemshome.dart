import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:ecommerce1/view/screens/itemdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../LinkAPI.dart';

class ListItemsHome extends StatelessWidget {
  ItemsModel items;
  ListItemsHome({required this.items});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.itemdetails, arguments: {'itemModel': items});
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              Container(
                width: 140,
                height: 20,
                child: Text(
                  '${items.items_name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              Stack(
                children: [
                  Container(
                      height: 100,
                      width: 140,
                      child: Image.network(
                        '${ApiLink.itemsImages}${items.items_image}',
                        fit: BoxFit.cover,
                      )),
                  Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ],
          ),
          if (items.items_discound != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsetsDirectional.only(bottom: 10, end: 10),
              child: Text('Discount : ${items.items_discound}%'),
            )
        ],
      ),
    );
  }
}
