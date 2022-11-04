import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/Auth/login.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetPassword.dart';
import '../../../widgets/Auth/custom_logo_auth.dart';
import '../../../widgets/Auth/customtextfieldauth.dart';
import '../../../widgets/custombuttomauth.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassControllerImp controller = Get.put(ForgetPassControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Forget Password?',
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
              const CustomTextTitleAuth(
                text: 'Check Your Email',
              ),
              const CustomTextBodyAuth(
                  bodyText:
                      'Please Enter your Address to receive the verification code'),
              const SizedBox(
                height: 20,
              ),
              CustomTextFieldAuth(
                suffixIcon: Icons.email_outlined,
                label: 'Email',
                hint: 'Enter Your Email',
                controller: controller.email,
                onValidate: (String? value) {
                 return validInput(value!, 40, 5, 'email');
                },
              ),
              CustomButtonAuth(
                buttonText: 'Check',
                onPressed: ()async {
                  if(controller.formKey.currentState!.validate())
                    {
                     await controller.checkEmail();
                    if(controller.statusrequest==statusRequest.success){
                      Get.offNamed(AppRoutes.verificationForget);
                      Get.delete<ForgetPassControllerImp>();
                    }
                    else if(controller.statusrequest==statusRequest.offlineFailure){
                      Get.defaultDialog(title: 'Warning',middleText: 'check your internet');

                    }else if(controller.statusrequest==statusRequest.failure){
                      Get.defaultDialog(title: 'Warning',middleText: 'Wrong email');

                    }else if(controller.statusrequest==statusRequest.serverFailure){
                      Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server ');

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
