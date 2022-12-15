import 'package:ecommerce1/controller/categories_controller.dart';
import 'package:ecommerce1/controller/home/home_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../LinkAPI.dart';
import '../../controller/myorders.dart';
import '../../core/constant/color.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyOrdersControllerImp());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<MyOrdersControllerImp>(
        builder: (controller) {
          if (controller.statusrequest == statusRequest.success) {
            return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.grey)),
                    child: ListTile(
                      title: Text(
                          'Bill id : ${controller.ordersmodel[index].bills_id}'),
                      trailing: Text(
                          'Bill Salary : EGP${controller.ordersmodel[index].bills_items_salary}'),
                      subtitle: Text(
                          'Bill time : ${controller.ordersmodel[index].bills_time}'),
                    ),
                  ),
                  itemCount: controller.ordersmodel.length,
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
