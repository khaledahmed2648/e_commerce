import 'package:ecommerce1/controller/card/card.dart';
import 'package:ecommerce1/view/widgets/onBoarding/OnBoardingWidgets.dart';
import 'package:flutter/material.dart';

import '../../../LinkAPI.dart';
import '../../../data/model/carditemsmodel.dart';
import 'cardcontent.dart';
import 'package:get/get.dart';
import 'itemimageandcount.dart';

class CardItem extends StatelessWidget {
  final CardItemsModel item;
  const CardItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 208, 208, 208),
            borderRadius: BorderRadius.circular(20)),
        child: GetBuilder<CardControllerImp>(
          builder: (controller) => Row(children: [
            CardItemImageAndCount(
                itemCount: '${item.items_count!}',
                itemImage: '${ApiLink.itemsImages}${item.items_image!}',
                onAdd: () async {
                  item.items_count = item.items_count! + 1;
                  controller.itemsCount++;
                  await controller.addOrDeleteAddedCount(
                      item, item.items_count!);
                },
                onSub: () async {
                  item.items_count = item.items_count! - 1;
                  controller.itemsCount--;
                  await controller.addOrDeleteAddedCount(
                      item, item.items_count!);
                }),
            Expanded(
                flex: 1,
                child: Column(children: [
                  CardItemContent(
                      itemName: '${item.items_name}',
                      itemPrice: '${item.items_price!}',
                      itemDesc: '${item.items_desc}'),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 127, 126, 126))),
                    child: MaterialButton(
                      onPressed: () {
                        controller.deleteFromCard(
                            cardsItemId: '${item.items_id}');
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'delete',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  )
                ]))
          ]),
        ));
  }
}
