import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../data/model/itemsmodel.dart';
import '../home/listitemshome.dart';

class NewItemsList extends StatelessWidget {
  final List<ItemsModel> items;
  const NewItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (items[index].items_discound != 0) {
            return ListItemsHome(items: items[index]);
          } else {
            return Container();
          }
        },
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
