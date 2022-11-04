import 'package:ecommerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CostumCardHome extends StatelessWidget {
String mainText;
String secondaryText;
CostumCardHome({required this.mainText,required this.secondaryText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              top: -20,
              right: -20,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: AppColors.secondaryColor),
              )),
           ListTile(
            title: Text(
              mainText,
              textAlign: TextAlign.center,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              secondaryText,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
