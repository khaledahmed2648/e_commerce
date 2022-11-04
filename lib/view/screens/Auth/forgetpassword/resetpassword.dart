import 'package:ecommerce1/controller/Auth/login.dart';
import 'package:ecommerce1/controller/forgetpassword/resetpassword.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetPassword.dart';
import '../../../../core/constant/routes.dart';
import '../../../widgets/Auth/custom_logo_auth.dart';
import '../../../widgets/Auth/customtextfieldauth.dart';
import '../../../widgets/custombuttomauth.dart';

class ResetPassword extends StatelessWidget {
  ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomTextBodyAuth(
                  bodyText: 'Please Enter your New Password'),
              const SizedBox(
                height: 20,
              ),
              CustomTextFieldAuth(
                suffixIcon: Icons.lock_outline,
                label: 'Password',
                hint: 'Enter Your new password',
                controller: controller.password,
                onValidate: (value) {
                 return validInput(value!, 30, 5, 'password');
                },
              ),
              CustomTextFieldAuth(
                suffixIcon: Icons.lock_outlined,
                label: 'Password',
                hint: 'ReEnter Your password',
                controller: controller.rePassword,
                onValidate: (value) {
                 return validInput(value!, 30, 5, 'password');
                },
              ),
              CustomButtonAuth(
                buttonText: 'save',
                onPressed: ()async {
                  if (controller.formKey.currentState!.validate()) {
                if(controller.password.text==controller.rePassword.text){
                  await controller.checkPassword(pass: controller.password.text);
                  if(controller.statusrequest==statusRequest.success){
                    Get.offNamed(AppRoutes.successResetPass);
                    Get.delete<ForgetPassControllerImp>();
                  }
                  else if(controller.statusrequest==statusRequest.offlineFailure){
                    Get.defaultDialog(title: 'Warning',middleText: 'check your internet');

                  }else if(controller.statusrequest==statusRequest.failure){
                    Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server');

                  }else if(controller.statusrequest==statusRequest.serverFailure){
                    Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server ');

                  }
                }else {
                  Get.defaultDialog(title: 'Warning',middleText: 'The two passwords are not similar');

                }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
