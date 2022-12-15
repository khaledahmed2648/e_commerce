import 'package:ecommerce1/controller/bill_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:ecommerce1/view/widgets/bill/custom_bill_field.dart';
import 'package:ecommerce1/view/widgets/itemsdetails/addtocrardbuttonitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillDetails extends StatelessWidget {
  BillDetails({Key? key}) : super(key: key);
  var billKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(BillControllerImp());
    return Scaffold(
      body: GetBuilder<BillControllerImp>(builder: (controller) {
        if (controller.statusrequest == statusRequest.loading ||
            controller.statusrequest == statusRequest.initialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.statusrequest == statusRequest.success) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: billKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Bill id : ${controller.bills_id}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bill time : ${controller.bills_time}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 222, 219, 219),
                            border: Border.all(
                                width: 3,
                                color: Color.fromARGB(255, 149, 149, 149))),
                        child: ListTile(
                          leading: Text(
                            '${controller.items[index].items_name}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.red),
                          ),
                          title: Text(
                            'Quantity : ${controller.items[index].items_count}',
                            style: const TextStyle(color: Colors.red),
                          ),
                          trailing: Text(
                            'EGP${controller.itemPrice[index]}',
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: 10,
                        color: Colors.white,
                        width: double.infinity,
                      ),
                      itemCount: controller.items.length,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Proscessing & Delivery: EGP${controller.bills_dilivary_salary}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Total salary: EGP${controller.totalSalary}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Your Address',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 10, 10, 10),
                          fontWeight: FontWeight.bold),
                    ),
                    CustomBillFormFeild(
                      hint: 'City',
                      controller: controller.cityController,
                      onValidate: (value) {
                        if (value!.length < 5) {
                          return 'Invalid city name';
                        }
                      },
                    ),
                    CustomBillFormFeild(
                      hint: 'Region',
                      controller: controller.regionController,
                      onValidate: (value) {
                        if (value!.length < 5) {
                          return 'Invalid region name';
                        }
                      },
                    ),
                    CustomBillFormFeild(
                      hint: 'Street',
                      controller: controller.streetController,
                      onValidate: (value) {
                        if (value!.length < 5) {
                          return 'Invalid street name';
                        }
                      },
                    ),
                    CustomBillFormFeild(
                      hint: 'Building name',
                      controller: controller.buildingController,
                      onValidate: (value) {
                        if (value!.length < 5) {
                          return 'Invalid building name';
                        }
                      },
                    ),
                    CustomBillFormFeild(
                      hint: 'Floor & apartment',
                      controller: controller.apartmentController,
                      onValidate: (value) {
                        if (value!.length < 5) {
                          return 'Invalid apartment name';
                        }
                      },
                    ),
                    AddToCardButtonItemOrBuy(
                        text: controller.addressInfo == null
                            ? 'Add your address'
                            : 'Update your address',
                        onTap: () {
                          if (billKey.currentState!.validate()) {
                            controller.updateAddress(
                                address:
                                    '${controller.cityController.text}/${controller.regionController.text}/${controller.streetController.text}/${controller.buildingController.text}/${controller.apartmentController.text}');
                          }
                        }),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 30),
                        width: double.infinity,
                        child: AddToCardButtonItemOrBuy(
                            text: 'Confirm your order',
                            onTap: () async {
                              if ((billKey.currentState!.validate())) {
                                if (controller.addressInfo != null) {
                                  await controller.confirmbill();
                                }
                              }
                            })),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Failer'),
          );
        }
      }),
    );
  }
}
