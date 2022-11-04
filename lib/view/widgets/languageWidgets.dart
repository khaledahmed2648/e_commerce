
import 'package:flutter/material.dart';

Widget customButtonLang({required String textButton,required void Function()? onPressed})=>Container(
    margin:const EdgeInsets.symmetric(horizontal: 60,vertical: 2.5),

    width: double.infinity,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    ));