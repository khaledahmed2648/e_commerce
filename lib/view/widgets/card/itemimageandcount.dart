import 'package:flutter/material.dart';

class CardItemImageAndCount extends StatelessWidget {
  final String itemCount;
  final String itemImage;
  final void Function()? onAdd;
  final void Function()? onSub;
  const CardItemImageAndCount(
      {Key? key,
      required this.itemCount,
      required this.itemImage,
      required this.onAdd,
      required this.onSub})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 130,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          itemImage,
                        ),
                        fit: BoxFit.fill),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Container(
              width: 130,
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                    height: 30,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: const Color.fromARGB(255, 187, 181, 181)),
                    child: IconButton(
                        onPressed: onAdd,
                        icon: const Icon(
                          Icons.add,
                          size: 15,
                        )),
                  ),
                  Container(
                    width: 35,
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.symmetric(
                          horizontal: BorderSide(width: 2, color: Colors.grey),
                        )),
                    child: Text(
                      itemCount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: const Color.fromARGB(255, 187, 181, 181)),
                    child: IconButton(
                        onPressed: onSub,
                        icon: const Icon(
                          Icons.remove,
                          size: 15,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
