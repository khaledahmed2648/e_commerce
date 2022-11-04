import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/itemscontroller.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/view/widgets/listcategoriesItems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/home/costumappbarhome.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CostumAppBarHome(
                  onPressedNotification: () {}, hintText: 'Find your products'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ListCategoriesItems(
                      onTap: () {
                        controller.changeCategory(index);
                      },
                      categories: controller.categories[index],
                      catNumber: index),
                  itemCount: controller.categories.length,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .69),
                itemBuilder: (context, index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: '${ApiLink.itemsImages}camera.jpeg',
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        'camera lenovo xp',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'camera lenovo xp with opecity 45 migaBytes',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(children: [
                          Text('Rating: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          ...List.generate(5, (index) => Icon(Icons.star,size: 14,))
                        ],),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              '200.0\$ zaga',
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_sharp))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
