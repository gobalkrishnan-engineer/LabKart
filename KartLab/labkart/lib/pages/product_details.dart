import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/theme/theme.dart';

class ProductDetail extends StatelessWidget {
  var api, name, price, index;
  ProductDetail({Key? key, this.api, this.name, this.price, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
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
                api + "$index.jpg",
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.orange,
                  )),
              IconButton(
                  onPressed: () {},
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
