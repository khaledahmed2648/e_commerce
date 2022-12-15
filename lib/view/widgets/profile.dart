import 'package:ecommerce1/controller/profile_controller.dart';
import 'package:ecommerce1/core/class/crud.dart';
import 'package:ecommerce1/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(
      builder: (controller) {
        if (controller.statusrequest == statusRequest.success) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 196, 195, 195))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${controller.username}'),
                      Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 196, 195, 195))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${controller.phone}'),
                      Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 196, 195, 195))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${controller.email}'),
                      Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 196, 195, 195))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        controller.address,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
