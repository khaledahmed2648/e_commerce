import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomButtonAuth({Key? key, required this.buttonText,required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
        onPressed:onPressed,
        child: Text(buttonText),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
