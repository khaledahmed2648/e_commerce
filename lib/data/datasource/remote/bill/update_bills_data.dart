import '../../../../LinkAPI.dart';
import '../../../../core/class/crud.dart';

class UpdateBillsData {
  static updateBillConfirmation({required String bills_id}) async {
    var response = await Crud.postData(
        ApiLink.updatebillconfirmation, {'bills_id': bills_id});
    return response;
  }
}
