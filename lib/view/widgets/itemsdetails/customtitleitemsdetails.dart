// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';


class CustomTitleItemDetails extends StatelessWidget {
  String title;
   CustomTitleItemDetails({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin:const EdgeInsetsDirectional.only(bottom:10,start: 10),
            child: Text(title,style: Theme.of(context).textTheme.headline1!.copyWith(
              color: AppColors.brounColor,
              fontSize: 25
            ),),
          );
  }
}