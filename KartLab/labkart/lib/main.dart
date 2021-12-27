import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/pages/home.dart';

import 'controller/cart_controller.dart';

void main() {
  runApp(LabKart());
}

class LabKart extends StatelessWidget {
  var cartController = Get.put(CartController());

  LabKart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SafeArea(child: Home()),
    );
  }
}
