import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';

class BillData {
  static addToBill(
      {required String bills_itemsid_and_count,
      required String bills_items_salary,
      required String bills_dilivary_salary}) async {
    var response = await Crud.postData(ApiLink.addtobill, {
      'bills_user_id': MyServices.sharedPreferences.getString('id'),
      'bills_number': '${MyServices.sharedPreferences.getInt('cards_number')}',
      'bills_itemsid_and_count': bills_itemsid_and_count,
      'bills_items_salary': bills_items_salary,
      'bills_dilivary_salary': bills_dilivary_salary,
    });
    return response;
  }

  static deleteBill({required String bills_id}) async {
    var response =
        await Crud.postData(ApiLink.deletebill, {'bills_id': bills_id});
    return response;
  }

  static getBill() async {
    var response = await Crud.postData(ApiLink.getbill,
        {'users_id': MyServices.sharedPreferences.getString('id')});
    return response;
  }
}
