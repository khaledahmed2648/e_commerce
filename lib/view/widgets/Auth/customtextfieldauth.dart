import 'package:flutter/material.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final String hint ;
  final String label;
  final IconData suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? onValidate;
  final TextInputType? type;
  final bool? isPassword;
  final void Function()? onTapIcon;

  const CustomTextFieldAuth({Key? key,this.onTapIcon,this.isPassword, this.type,required this.hint,required this.label,required this.suffixIcon, this.controller ,this.onValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText:isPassword??false ,
        keyboardType: type??TextInputType.text,
        validator:onValidate ,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon:InkWell(child: Icon(suffixIcon),onTap:onTapIcon ,),
            label:Text(label),
            hintText: hint,
            hintStyle:const TextStyle(fontSize: 14),
            floatingLabelBehavior:FloatingLabelBehavior.always,
            contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            )

        ),
      ),
    );
  }
}
