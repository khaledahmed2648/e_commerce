import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  String title;
  CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: AlignmentDirectional.topStart,
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
