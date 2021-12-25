import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/pages/home.dart';

void main() {
  runApp(LabKart());
}

class LabKart extends StatelessWidget {
  const LabKart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SafeArea(child: Home()),
    );
  }
}
