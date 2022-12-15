import 'package:ecommerce1/core/constant/routes.dart';
import 'package:ecommerce1/view/widgets/Auth/customtexttitleauth.dart';
import 'package:ecommerce1/view/widgets/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Success Order',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.green),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextTitleAuth(
                text: 'Your Order will arrive to you within two days'),
            const Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                  buttonText: ' Search about products',
                  onPressed: () {
                    Get.offNamed(AppRoutes.home);
                  }),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
