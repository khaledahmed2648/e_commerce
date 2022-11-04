import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:ecommerce1/view/widgets/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Success SignUp',
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
             const Spacer(),
              Container(
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
