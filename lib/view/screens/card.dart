import 'package:ecommerce1/controller/card/card.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/widgets/card/cardcontent.dart';
import 'package:ecommerce1/view/widgets/card/carditem.dart';
import 'package:ecommerce1/view/widgets/card/itemimageandcount.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/addtocrardbuttonitem.dart';
import 'package:ecommerce1/view/widgets/onBoarding/OnBoardingWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widgets/home/costumappbarhome.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardControllerImp controllerImp = Get.put(CardControllerImp());

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: AddToCardButtonItemOrBuy(
            text: 'Buy now',
            onTap: () {
              Get.toNamed(AppRoutes.billdetails,
                  arguments: {'items': controllerImp.items});
            }),
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            CostumAppBarHome(
                onPressedFavorite: () {
                  Get.toNamed(AppRoutes.favoritesscreen);
                },
                onPressedNotification: () {},
                hintText: 'Find your product'),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CardControllerImp>(
              builder: (controller) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        CardItem(item: controller.items[index]),
                    separatorBuilder: (context, index) => Container(
                          height: 10,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                    itemCount: controller.items.length);
              },
            ),
          ],
        ),
      ),
    );
  }
}
