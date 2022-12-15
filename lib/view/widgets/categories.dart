import 'package:ecommerce1/controller/categories_controller.dart';
import 'package:ecommerce1/controller/home/home_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../LinkAPI.dart';
import '../../core/constant/color.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    Get.put(CategoriesControllerImp());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<CategoriesControllerImp>(
        builder: (controller) {
          if (controller.statusrequest == statusRequest.success) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    homeControllerImp.goToItems(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 150,
                        height: 130,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            '${ApiLink.categoriesImages}${controller.categoriesModel[index].categories_image}'),
                      ),
                      Text(
                          '${controller.categoriesModel[index].categories_name}')
                    ],
                  ),
                );
              },
              itemCount: controller.categoriesModel.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
