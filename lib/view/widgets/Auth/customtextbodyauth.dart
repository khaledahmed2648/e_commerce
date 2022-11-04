import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String bodyText;

  const CustomTextBodyAuth({Key? key,required this.bodyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin:const EdgeInsets.only(left: 30,right: 30,bottom: 20),
        child: Text(
          bodyText,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey,fontSize: 16),
          textAlign: TextAlign.center,

        ));
  }
}
