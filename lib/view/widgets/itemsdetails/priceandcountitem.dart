import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class PriceAndCountItemDetails extends StatelessWidget {
  int price;
  String count;
  int itemsDiscount;
  void Function()? onAdd;
  void Function()? onSub;
  PriceAndCountItemDetails(
      {Key? key,
      required this.price,
      required this.itemsDiscount,
      required this.onAdd,
      required this.onSub,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double discountPrice = 0;
    print(itemsDiscount);
    print(price);
    discountPrice = (itemsDiscount) / 100 * price + price;
    print(discountPrice);
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
      child: Row(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.mainColor)),
                child: Text(
                  count,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              IconButton(onPressed: onSub, icon: const Icon(Icons.remove)),
            ],
          ),
          const Spacer(),
          Text(
            'EGP$price',
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          if (itemsDiscount != 0)
            Text(
              '${discountPrice.toInt()}',
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis),
            )
        ],
      ),
    );
  }
}
