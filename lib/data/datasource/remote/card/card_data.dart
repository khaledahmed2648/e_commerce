import 'package:ecommerce1/LinkAPI.dart';
import 'package:ecommerce1/core/class/crud.dart';

class CardData {
  static getCarddata(
      {required String cardsNumber, required String cardsUserId}) {
    var response = Crud.getData(ApiLink.getcard,
        {'cards_number': cardsNumber, 'cards_userid': cardsUserId});
    return response;
  }

  static getItemFromCarddata(
      {required String cardsNumber,
      required String cardsUserId,
      required String cardsItemId}) {
    var response = Crud.getData(ApiLink.getitemfromcard, {
      'cards_number': cardsNumber,
      'cards_userid': cardsUserId,
      'cards_itemid': cardsItemId
    });
    return response;
  }

  static addToCard({
    required String cardsNumber,
    required String cardsUserId,
    required String cardsItemId,
    required String cardsitemcount,
  }) {
    var response = Crud.postData(ApiLink.addtocard, {
      'cards_number': int.parse(cardsNumber),
      'cards_userid': int.parse(cardsUserId),
      'cards_itemid': int.parse(cardsItemId),
      'cards_itemcount': int.parse(cardsitemcount)
    });
    return response;
  }

  static deleteFromCard(
      {required String cardsNumber,
      required String cardsUserId,
      required String cardsItemId}) {
    var response = Crud.getData(ApiLink.deletefromcard, {
      'cards_number': int.parse(cardsNumber),
      'cards_userid': int.parse(cardsUserId),
      'cards_itemid': int.parse(cardsItemId)
    });
    return response;
  }

  static updateCard(
      {required String cardsNumber,
      required String cardsUserId,
      required String cardsItemId,
      required String cardsItemCount}) {
    var response = Crud.getData(ApiLink.updatecard, {
      'cards_number': cardsNumber,
      'cards_userid': cardsUserId,
      'cards_itemid': cardsItemId,
      'cards_itemcount': cardsItemCount
    });
    return response;
  }
}
