import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/data/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/functions.dart';
class TestConteroller extends GetxController{

 TestData testData=TestData();
 List data=[];
  statusRequest statusrequest=statusRequest.loading;
  getData()async{
try{
 var response;

 print('==================================================');

 print(response.data);
 print('==================================================');
 print(response.statusCode);
 print('==================================================');
 print(response.statusMessage);
 print('==================================================');
 print(response.headers);
 print('==================================================');

}catch(error){

print('error : $error');
print('-=======================================');

}
  }


 @override
  void onInit() {
   getData();
    super.onInit();
  }
}