import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/controller/Auth/signup.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/core/functions/functions.dart';
import 'package:ecommerce1/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/Auth/custom_logo_auth.dart';
import '../../widgets/Auth/customtextfieldauth.dart';
import '../../widgets/custombuttomauth.dart';

class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'sign Up',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
      ),
      body:WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextTitleAuth(
                  text: 'welcome'.tr,
                ),
                CustomTextBodyAuth(
                    bodyText:
                    'Sign Up With Your Email And Password OR Continue With Social Media'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAuth(
                  suffixIcon: Icons.email_outlined,
                  label: 'UserName',
                  hint: 'Enter Your UserName',
                  controller: controller.name,
                  onValidate: (value){
                    return validInput(value!, 30, 5, 'username');
                  },
                ),
                CustomTextFieldAuth(
                  type: TextInputType.emailAddress,
                  suffixIcon: Icons.email_outlined,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  controller: controller.email,
                  onValidate: (value){
                    return validInput(value!, 30, 5, 'email');
                  },
                ),
                CustomTextFieldAuth(
                  suffixIcon: Icons.lock_outline,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  controller: controller.password,
                  onValidate: (value){
                    return validInput(value!, 30, 5, 'password');
                  },
                ),
                CustomTextFieldAuth(
                    type: TextInputType.phone,
                    suffixIcon: Icons.lock_outline,
                    label: 'Phone',
                    hint: 'Enter Your Phone',
                    controller: controller.phone,
                    onValidate: (value){
                      return validInput(value!, 30, 5, 'phone');
                    }
                ),
                 GetBuilder<SignUpControllerImp>(
                   builder: (controller){
                     if(controller.statusrequest==statusRequest.loading){
                       return const Center(child: CircularProgressIndicator(),);
                     }
                     else{
                       return CustomButtonAuth(
                         buttonText: 'Sign Up',
                         onPressed: ()async {
                           if (controller.formKey.currentState!.validate()) {
                             await controller.postSignupData();
                             if(controller.statusrequest==statusRequest.success){
                               Get.offNamed(AppRoutes.signupverificationcode,arguments: {
                                 'email':controller.email.text
                               });
                               Get.delete<SignUpControllerImp>();

                             }else if(controller.statusrequest==statusRequest.offlineFailure){
                               Get.defaultDialog(title: 'Warning',middleText: 'check your internet');

                             }else if(controller.statusrequest==statusRequest.failure){
                               Get.defaultDialog(title: 'Warning',middleText: 'email or password is repeated\n please ensure from them ');

                             }else if(controller.statusrequest==statusRequest.serverFailure){
                               Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server ');

                             }
                           }
                         },
                       );

                     }
                   },
                 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('have an account?'),
                    InkWell(
                      child: const Text(
                        ' Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        controller.getToLogin();

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
