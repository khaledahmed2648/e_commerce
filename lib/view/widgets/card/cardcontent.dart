import 'package:flutter/material.dart';

class CardItemContent extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemDesc;
  const CardItemContent(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.itemDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            itemName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            itemPrice,
            style: const TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              itemDesc,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
