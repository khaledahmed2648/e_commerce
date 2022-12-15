import 'package:ecommerce1/view/screens/home.dart';
import 'package:ecommerce1/view/widgets/Orders.dart';
import 'package:ecommerce1/view/widgets/categories.dart';
import 'package:ecommerce1/view/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<IconData> bottomAppBarIcons = [
    Icons.home,
    Icons.person,
    Icons.home,
    Icons.category,
    Icons.badge_outlined
  ];
  List<String> bottomAppBarTitle = [
    'Home',
    'Profile',
    '',
    'Categories',
    'Orders'
  ];
  List<Widget> listPage = [
    const Home(),
    Profile(),
    Container(),
    Categories(),
    Orders(),
  ];
  @override
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
