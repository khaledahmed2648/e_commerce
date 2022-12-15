import 'package:ecommerce1/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';

import '../../../LinkAPI.dart';
import '../../../core/constant/color.dart';

class ListCategoriesHome extends StatelessWidget {
  void Function()? onTap;
  CategoriesModel categories;
  ListCategoriesHome({required this.onTap, required this.categories});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Image.network(
                '${ApiLink.categoriesImages}${categories.categories_image}'),
          ),
          Text('${categories.categories_name}')
        ],
      ),
    );
  }
}
