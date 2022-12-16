import 'package:ecommerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CostumAppBarHome extends StatelessWidget {
  String hintText;
  void Function()? onPressedSettings;
  void Function()? onPressedFavorite;
  CostumAppBarHome(
      {required this.onPressedSettings,
      required this.onPressedFavorite,
      required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: hintText,
                      prefixIcon: const Icon(
                        Icons.search,
                      )),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor),
              child: IconButton(
                  onPressed: onPressedFavorite,
                  icon: Icon(
                    Icons.favorite_outline_sharp,
                    color: Colors.grey[600],
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor),
              child: IconButton(
                  onPressed: onPressedSettings,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[600],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
