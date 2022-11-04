import '../../../LinkAPI.dart';
import '../../../core/class/crud.dart';

class HomeData{
  static getHomeData()async{
    var response=await Crud.postData(ApiLink.home,{});
    return response;
  }
}