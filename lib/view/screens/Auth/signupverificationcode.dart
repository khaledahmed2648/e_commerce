import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/widgets/Auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/Auth/verificationcode.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class SignUpVerificationCode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(VerificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: ListView(
          children: [

            const SizedBox(
              height: 10,
            ),
            const CustomTextBodyAuth(bodyText: 'We texted you a code \n Please enter it below '),

            const SizedBox(
              height: 20,
            ),
             GetBuilder<VerificationControllerImp>(
               builder: (controller){
                 return OtpTextField(
                   borderWidth: 50,
                   borderRadius: BorderRadius.circular(10),
                   numberOfFields: 5,
                   focusedBorderColor: Colors.blue,
                   //set to true to show as box or false to show as dash
                   showFieldAsBox: true,
                   //runs when a code is typed in
                   onCodeChanged: (String code) {
                     //handle validation or checks here
                   },
                   //runs when every textfield is filled
                   onSubmit: (String verificationCode)async{
                     await controller.goToSuccessSignup(verifyCode: verificationCode);
                     if(controller.statusrequest==statusRequest.success){
                       Get.offNamed(AppRoutes.successsignup);
                        Get.delete<VerificationControllerImp>();
                     }
                     else if(controller.statusrequest==statusRequest.offlineFailure){
                       Get.defaultDialog(title: 'Warning',middleText: 'check your internet');

                     }
                     else if(controller.statusrequest==statusRequest.failure){
                       Get.defaultDialog(title: 'Mistake',middleText: 'This is not the right code  ');

                     }
                     else if(controller.statusrequest==statusRequest.serverFailure){
                       Get.defaultDialog(title: 'Warning',middleText: 'their is a problem with the server ');

                     }

                   }, // end onSubmit
                 );
               },
             ),


            
          ],
        ),
      ),
    );
  }
}
