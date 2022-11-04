import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../LinkAPI.dart';

class ListItemsHome extends StatelessWidget {
  ItemsModel items;
ListItemsHome({required this.items});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          height: 20,
          child: Text(
            '${items.items_name}',
            style:const TextStyle(
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
                  borderRadius:
                  BorderRadius.circular(20)),
            ),

          ],
        ),
      ],
    );
  }
}
