class FavoritesModel {
  int? favorites_id;
  int? favorites_userid;
  int? favorites_itemid;
  FavoritesModel.fromJson(Map<String, dynamic> json) {
    favorites_id = json['favorites_id'];
    favorites_userid = json['favorites_userid'];
    favorites_itemid = json['favorites_itemid'];
  }
}
