import '../../../LinkAPI.dart';
import '../../../core/class/crud.dart';

class ItemsData{
  static getItemsData()async{
    var response=await Crud.postData(ApiLink.items,{});
    return response;
  }
}