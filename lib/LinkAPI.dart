class ApiLink {
  static const String server = "http://10.0.2.2/ecommerce";
  static const String test = "$server/test.php";
// ================Auth===========
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifyCode.php";

  // ==============ForgetPassword===========
  static const String verifyCodeForgetPass =
      "$server/forgetpassword/verifyCodereset.php";
  static const String checkEmailForgetPass =
      "$server/forgetpassword/checkemail.php";
  static const String resetPassForget =
      "$server/forgetpassword/resetpassword.php";
  //=============================card======================
  static const String getcard = "$server/card/getcard.php";
  static const String getitemfromcard = "$server/card/getitemfromcard.php";
  static const String addtocard = "$server/card/addtocard.php";
  static const String deletefromcard = "$server/card/deletefromcard.php";
  static const String updatecard = "$server/card/updatecard.php";
  //=========================users_info===============
  static const String getusersinfo = "$server/settings/get_users_info.php";
  static const String update_address = "$server/settings/update_address.php";

  //==========================bill========================
  static const String addtobill = "$server/bill/addtobill.php";
  static const String deletebill = "$server/bill/deletebill.php";
  static const String getbill = "$server/bill/getbill.php";
  static const String updatebillconfirmation =
      "$server/bill/updatebillconfirmation.php";

  //=============================categories======================
  static const String categories = "$server/categories/categories.php";
  //=============================home======================
  static const String home = "$server/home.php";
  //========================items==========
  static const String items = "$server/items/items.php";
  //================favorites==========
  static const String addToFavorites = "$server/favorites/addtofavorites.php";
  static const String getallfavorites = "$server/favorites/getallfavorites.php";
  static const String deleteFromFavorites =
      "$server/favorites/deletefromfavorites.php";

  //==============================static images
  static const String categoriesImages = "$server/uploads/categories/";
  static const String itemsImages = "$server/uploads/items/";
}
