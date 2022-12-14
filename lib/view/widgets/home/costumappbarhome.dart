import 'package:ecommerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CostumAppBarHome extends StatelessWidget {
String hintText;
void Function()? onPressedNotification;
CostumAppBarHome({required this.onPressedNotification,required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: hintText,
                  prefixIcon:const Icon(
                    Icons.search,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColor
          ),
          child: IconButton(
              onPressed:onPressedNotification,
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.grey[600],
              )),
        )
      ],
    );
  }
}
