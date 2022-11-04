import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/screens/Auth/signupverificationcode.dart';
import 'package:ecommerce1/view/screens/Auth/successsignup.dart';
import 'package:ecommerce1/view/screens/Auth/forgetpassword/verificationcodeforget.dart';
import 'package:ecommerce1/view/screens/OnBoarding.dart';
import 'package:ecommerce1/view/screens/Auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce1/view/screens/Auth/login.dart';
import 'package:ecommerce1/view/screens/Auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce1/view/screens/Auth/forgetpassword/resetpasswordsuccess.dart';
import 'package:ecommerce1/view/screens/Auth/signup.dart';
import 'package:ecommerce1/view/screens/homescreen.dart';
import 'package:ecommerce1/view/screens/items.dart';
import 'package:ecommerce1/view/screens/language.dart';

import 'package:get/get.dart';

import 'core/mainmiddleware/mainmiddleware.dart';
List<GetPage<dynamic>>? routes=[
 // GetPage(name: '/',page:()=>const TestView()),
  GetPage(name:'/',page:()=>const Language(),middlewares: [
    MainMiddleWare()
  ] ),
  GetPage(name:AppRoutes.login,page:()=> Login() ),
  GetPage(name:AppRoutes.onBoarding,page:()=> OnBoarding() ),
  GetPage(name:AppRoutes.signUp,page:()=> SignUp() ),
  GetPage(name:AppRoutes.forgetPass,page:()=> ForgetPassword() ),
  GetPage(name:AppRoutes.verificationForget,page:()=> VerificationCodeForget() ),
  GetPage(name:AppRoutes.resetPassword,page:()=> ResetPassword() ),
  GetPage(name:AppRoutes.successResetPass,page:()=>const SuccessResetPass() ),
  GetPage(name:AppRoutes.home,page:()=>const HomeScreen() ),
  GetPage(name:AppRoutes.successsignup,page:()=>const SuccessSignUp() ),
  GetPage(name:AppRoutes.signupverificationcode,page:()=> SignUpVerificationCode() ),
  GetPage(name:AppRoutes.items,page:()=> Items() ),
];
