import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/routes.dart';
import '../../../widgets/custombuttomauth.dart';


class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Success Reset Password',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.green),
        ),
      ),
      body:Container(
        padding:const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(child:  Icon(Icons.check_circle,
              color: Colors.green,size: 200,),),
            const SizedBox(height: 20,),
            const CustomTextTitleAuth(text: 'You Can Go To Login Page To Login'),
            const Spacer(
              flex: 1,
            ),
            Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              child: CustomButtonAuth(buttonText: ' Sign In', onPressed: (){
                Get.offAllNamed(AppRoutes.login);
              }),
            ),
            SizedBox(
              height: 30,
            )

          ],
        ),
      ) ,
    );


  }
}
