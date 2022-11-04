import 'package:ecommerce1/controller/Auth/login.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../widgets/Auth/custom_logo_auth.dart';
import '../../widgets/Auth/customtextfieldauth.dart';
import '../../widgets/custombuttomauth.dart';

class Login extends StatelessWidget {
  LoginControllerImp controller = Get.put(LoginControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'signUp'.tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const CustomLogoAuth(),
                const SizedBox(
                  height: 10,
                ),
                CustomTextTitleAuth(
                  text: 'welcome'.tr,
                ),
                CustomTextBodyAuth(bodyText: 'welcomeDescription'.tr),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAuth(
                  suffixIcon: Icons.email_outlined,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  controller: controller.email,
                  onValidate: (value){
                    return validInput(value!, 30, 5, 'email');
                  },
                ),
               GetBuilder<LoginControllerImp>(
                 builder:(controller)=> CustomTextFieldAuth(
                   isPassword: controller.isPassHidden,
                   onTapIcon: (){controller.changePassState();},
                     suffixIcon: Icons.lock_outline,
                     label: 'Password',
                     hint: 'Enter Your Password',
                     controller: controller.password,
                     onValidate: (value){
                       return validInput(value!, 30, 5, 'password');
                     } ,
               )),
                InkWell(
                  child: const Text(
                    'Forget Password',
                  ),
                  onTap: () {

                    controller.getToForgetPass();
                  },
                ),
                CustomButtonAuth(buttonText: 'Sign In', onPressed: ()async {
                  if(controller.formKey.currentState!.validate()){
                    await controller.postLogin();
                    if(controller.statusrequest==statusRequest.success){


                      MyServices.sharedPreferences.setBool('homePage', true);
                      Get.offNamed(AppRoutes.home);
                      Get.delete<LoginControllerImp>();

                    }else if(controller.statusrequest==statusRequest.offlineFailure){
                      Get.defaultDialog(title: 'Warning',middleText: 'check your internet');

                    }else if(controller.statusrequest==statusRequest.failure){
                      Get.defaultDialog(title: 'Warning',middleText: 'email or password is wrong ');

                    }else if(controller.statusrequest==statusRequest.serverFailure){
                      Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server ');

                    }
                  }
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    InkWell(
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        controller.getToSignUp();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
