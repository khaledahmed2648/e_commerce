class MyOrdersModel {
  int? bills_id;
  int? bills_items_salary;
  int? bills_confirm;
  String? bills_time;
  MyOrdersModel.fromJson(Map<String, dynamic> data) {
    bills_id = data['bills_id'];
    bills_items_salary = data['bills_items_salary'];
    bills_confirm = data['bills_confirm'];
    bills_time = data['bills_time'];
  }
}
