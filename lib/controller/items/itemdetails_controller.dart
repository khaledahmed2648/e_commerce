import 'package:ecommerce1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
abstract class ItemDetailsController extends GetxController{

}

class ItemDetailsControllerImp extends ItemDetailsController{
  late ItemsModel itemsModel;

  @override
  void onInit() {
    itemsModel=Get.arguments['itemModel'];
  }
}
