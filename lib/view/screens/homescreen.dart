import 'package:ecommerce1/core/constant/color.dart';
import 'package:ecommerce1/view/widgets/home/costumbottombarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/homescreen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.shopping_basket_rounded),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length, (index){
                    if(index==2){
                      return const Spacer();
                    }
                    else{
                      return CustomBottomBarItemHome(
                        onPressed: () {
                          controller.changePage(index);
                        },
                        iconItem: Icons.home,
                        textItem: controller.bottomAppBarTitle[index],
                        selectedItemColor:controller.currentPage==index?AppColors.mainColor:null ,
                      );
                    }
                  })
                  // CustomBottomBarItemHome(
                  //     onPressed: () {
                  //       controller.changePage(1);
                  //     },
                  //     iconItem: Icons.person,
                  //     textItem: 'Profile',
                  //   selectedItemColor:controller.currentPage==1?AppColors.mainColor:null ,
                  // ),
                  // const Spacer(),
                  // CustomBottomBarItemHome(
                  //     onPressed: () {
                  //       controller.changePage(2);
                  //     },
                  //     iconItem: Icons.favorite_border_outlined,
                  //     textItem: 'Favorites',
                  //   selectedItemColor:controller.currentPage==2?AppColors.mainColor:null ,
                  // ),
                  // CustomBottomBarItemHome(
                  //     onPressed: () {
                  //       controller.changePage(3);
                  //     },
                  //     iconItem: Icons.settings,
                  //     textItem: 'Settings',
                  //   selectedItemColor:controller.currentPage==3?AppColors.mainColor:null ,
                  // ),
                ],
              ),
            ),
            body: controller.listPage[controller.currentPage],
          )),
    );
  }
}
