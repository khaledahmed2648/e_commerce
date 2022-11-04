class CategoriesModel{
  int? categories_id;
  String? categories_name;
  String? categories_name_ar;
  String? categories_image;
  String? categories_time;
  CategoriesModel.fromJson(Map<String,dynamic>data){
    categories_id=data['categories_id'];
    categories_name=data['categories_name'];
    categories_name_ar=data['categories_name_ar'];
    categories_image=data['categories_image'];
    categories_time=data['categories_time'];

  }
}