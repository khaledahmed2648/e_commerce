import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CustomBillFormFeild extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? onValidate;
  final TextInputType? type;
  final bool? isPassword;
  final void Function()? onTapIcon;

  const CustomBillFormFeild(
      {Key? key,
      this.onTapIcon,
      this.isPassword,
      this.type,
      required this.hint,
      this.controller,
      this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isPassword ?? false,
        keyboardType: type ?? TextInputType.text,
        validator: onValidate,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
