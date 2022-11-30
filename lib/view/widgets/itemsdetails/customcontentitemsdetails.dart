// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';


class CustomContentItemDetails extends StatelessWidget {
  String content;
   CustomContentItemDetails({Key? key,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin:const EdgeInsets.all(10),
            child: Text('$content',style: TextStyle(color: AppColors.brounColor,fontSize: 15)),
          
          );
  }
}