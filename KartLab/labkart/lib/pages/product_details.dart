import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/component/pop_up.dart';
import 'package:labkart/controller/cart_controller.dart';
import 'package:labkart/theme/theme.dart';

import 'cart_list.dart';
import 'cart_product.dart';

class ProductDetail extends StatelessWidget {
  var api, name, price, index;
  ProductDetail({Key? key, this.api, this.name, this.price, this.index})
      : super(key: key);

  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CartList());
              },
              icon: Icon(Icons.notification_add)),
          Align(
              alignment: Alignment.center,
              child:
                  Obx(() => Text("${cartController.cartList.value.length}"))),
          SizedBox(width: 20)
        ],
        backgroundColor: ORANGE,
        title: Text("Product Details"),
      ),
      body: productDetails(),
    );
  }

  productDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              "$name$index".toUpperCase(),
              style: TextStyle(fontSize: 20, color: ORANGE),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(HOME_BORDER_RADIUS)),
              child: Image.network(
                api + "$index.jpg" + "?dummy=$index",
                width: Get.width,
                height: Get.height / 2,
              ),
            ),
          ),
          Text.rich(TextSpan(
              text: "Price :",
              style: TextStyle(color: ORANGE, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: "${price} Rs/-",
                    style: TextStyle(color: Colors.black))
              ])),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    CartDetail cartdetail = CartDetail(
                        api: api, name: name, price: price, index: index);
                    cartController.cartList.add(cartdetail);
                    cartController.total.value += price;
                  },
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.orange,
                  )),
              IconButton(
                  onPressed: () {
                    popUp();
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.orange,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text.rich(TextSpan(
                text: "Description :",
                style: TextStyle(color: ORANGE, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text:
                          "\nA descriptive paragraph is a collection of multiple sentences to convey a distinct message of a single person, place or thing. ... A well-written descriptive paragraph pulls in all five senses to engage the reader. The use of smell, sight, touch, sound and taste in expressive language captivates the reader on many levels",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal))
                ])),
          ),
        ],
      ),
    );
  }
}
