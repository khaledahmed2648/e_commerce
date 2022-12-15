import 'package:ecommerce1/controller/home/home_controller.dart';
import 'package:ecommerce1/controller/favorite_controller.dart';
import 'package:ecommerce1/controller/items/itemscontroller.dart';
import 'package:ecommerce1/view/widgets/favorties/listitemsfavorites.dart';
import 'package:ecommerce1/view/widgets/items/listitemsItems.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/listitemshome.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(10), child: ListItemsFavorites()),
    );
  }
}
