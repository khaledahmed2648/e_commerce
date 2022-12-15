import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/class/crud.dart';

class FavoritesData {
  static addToFavorites(String usersId, String itemsId) {
    var response = Crud.postData(
        ApiLink.addToFavorites, {'users_id': usersId, 'items_id': itemsId});
    return response;
  }

  static deleteFromFavorites(String usersId, String itemsId) {
    var response = Crud.postData(ApiLink.deleteFromFavorites,
        {'users_id': usersId, 'items_id': itemsId});
    return response;
  }

  static getFavorties(String usersId) {
    var response =
        Crud.postData(ApiLink.getallfavorites, {'users_id': usersId});
    return response;
  }
}
