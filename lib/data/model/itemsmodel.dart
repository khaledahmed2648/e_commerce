class ItemsModel{

  // "items_id": 4,
  // "items_name": "laptop hp 7 celipration",
  // "items_name_ar": "لابتوب اتش بي الجيل السابع",
  // "items_desc": "laptop hp \r\nram 8 \r\ncore i 7\r\ngpu intel 2 giga",
  // "items_desc_ar": "لابتوب اتش بي \r\nرام 8\r\nكور اي 7\r\nكارت شاشة انتل 2 جياجا\r\n",
  // "items_image": "laptop.jpeg",
  // "items_count": 0,
  // "items_active": 1,
  // "items_price": 9000,
  // "items_discound": 30,
  // "items_date": "2022-11-02 08:41:25",
  // "items_cat": 1,
  // "categories_id": 1,
  // "categories_name": "laptops",
  // "categories_name_ar": "لابتوبات",
  // "categories_image": "laptop.png",
  // "categories_time": "2022-10-29 21:48:55"?
   int? items_id   ;
   String? items_name;
   String? items_name_ar;
   String? items_desc;
   String? items_desc_ar;
   String? items_image;
   int? items_count;
   int? items_active;
   int? items_price;
   int? items_discound;
   String? items_date;
   int? items_cat;
   int? categories_id;
   String? categories_name;
   String? categories_name_ar;
   String? categories_image;
   String? categories_time;
   String? favorite;
   ItemsModel.fromJson(Map<String,dynamic> json){
     items_id          =json['items_id'];
     items_name        =json['items_name'];
     items_name_ar     =json['items_name_ar'];
     items_desc        =json['items_desc'];
     items_desc_ar     =json['items_desc_ar'];
     items_image       =json['items_image'];
     items_count       =json['items_count'];
     items_active      =json['items_active'];
     items_price       =json['items_price'];
     items_discound    =json['items_discound'];
     items_date        =json['items_date'];
     items_cat         =json['items_cat'];
     categories_id     =json['categories_id'];
     categories_name   =json['categories_name'];
     categories_name_ar=json['categories_name_ar'];
     categories_image  =json['categories_image'];
     categories_time   =json['categories_time'];
     favorite   =json['favorites'].toString();
   }
}