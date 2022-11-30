import 'package:ecommerce1/view/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
abstract class HomeScreenController extends GetxController{
  changePage(int i);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage=0;
  List<String> bottomAppBarTitle=[
    'Home',
    'Profile',
    '',
    'Favorites',
    'Settings'
  ];
  List<Widget> listPage=[
    const Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
         Center(child: Text('Profile'),)
      ],
    ),
    Container(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
         Center(child: Text('Favorites'),)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
         Center(child: Text('Settings'),)
      ],
    ),
  ];
  @override
  @override
  changePage(int i) {
    currentPage=i;
    update();
  }
  }




