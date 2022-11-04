class ApiLink{
     static const String server="http://10.0.2.2/ecommerce";
      static const  String  test = "$server/test.php";
// ================Auth===========
  static const String signUp="$server/auth/signup.php";
  static const String login="$server/auth/login.php";
  static const String verifyCodeSignUp="$server/auth/verifyCode.php";

  // ==============ForgetPassword===========
  static const String verifyCodeForgetPass="$server/forgetpassword/verifyCodereset.php";
  static const String checkEmailForgetPass="$server/forgetpassword/checkemail.php";
  static const String resetPassForget="$server/forgetpassword/resetpassword.php";
  //=============================home======================
  static const String home="$server/home.php";
  //========================items==========
  static const String items="$server/items/items.php";
  //==============================static images
  static const String categoriesImages="$server/uploads/categories/";
  static const String itemsImages="$server/uploads/items/";


}