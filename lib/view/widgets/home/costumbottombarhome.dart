import 'package:flutter/material.dart';

class CustomBottomBarItemHome extends StatelessWidget {
  void Function() onPressed;
  IconData iconItem;
  String textItem;
  Color? selectedItemColor;

   CustomBottomBarItemHome({Key? key,required this.onPressed,required this.iconItem,required this.textItem,this.selectedItemColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconItem,color: selectedItemColor),
        Text(textItem,style: TextStyle(color: selectedItemColor),)
      ],
    ),);
  }
}
