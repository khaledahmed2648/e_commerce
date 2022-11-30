// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';


class AddToCardButtonItem extends StatelessWidget {
  String text;
  void Function()? onTap;
   AddToCardButtonItem({Key? key,required this.text,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 40,
        margin:const EdgeInsets.all(10),
        child: MaterialButton(
          color: AppColors.mainColor,
          onPressed: onTap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(text,style:const TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 15),),
          
        ),
      );
  }
}