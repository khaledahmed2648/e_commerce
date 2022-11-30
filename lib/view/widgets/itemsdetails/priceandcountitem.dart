import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class PriceAndCountItemDetails extends StatelessWidget {
  String price;
  String count;
  void Function()? onAdd;
  void Function()? onSub;
   PriceAndCountItemDetails({Key? key,required this.price,required this.onAdd,required this.onSub,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin:const EdgeInsetsDirectional.only(top:10,start: 10),
            child: Row(
              children: [
                Row(children: [
                const SizedBox(width: 10,),
                IconButton(onPressed: onAdd, icon:const Icon(Icons.add)),
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 10),
                  padding:const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColors.mainColor)
                  ),
                  child: Text(count,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                IconButton(onPressed: onSub, icon:const Icon(Icons.remove)),
                ],),
                const Spacer(),
                Text('$price\$',style: TextStyle(color: AppColors.mainColor,fontSize: 25,fontWeight:FontWeight.bold),)
              ],
            ),
          );
           }
}