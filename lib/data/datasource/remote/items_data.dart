import '../../../LinkAPI.dart';
import '../../../core/class/crud.dart';

class ItemsData{
  static getItemsData(String categoryId,String usersId)async{
    var response=await Crud.postData(ApiLink.items,{
      'categories_id':categoryId,
      'users_id':usersId
    });
    return response;
  }
}