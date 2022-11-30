import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constant/color.dart';

class CustomColorItemDetails extends StatelessWidget {
  String title;
  Color textColor;
  Color containerColor;
   CustomColorItemDetails({Key? key,required this.title,required this.textColor,required this.containerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin:const EdgeInsetsDirectional.only(start: 10),
              alignment: Alignment.center,
              height: 60,
              width:90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor
                ),
                color: containerColor,

              ),
            child: Text(title,style: TextStyle(color: textColor),),);
  }
}