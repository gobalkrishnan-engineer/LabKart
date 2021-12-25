import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/pages/product_details.dart';
import 'package:labkart/theme/theme.dart';

class ProductList extends StatelessWidget {
  var api;
  int? length;
  ProductList({Key? key, this.api, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
        ],
        backgroundColor: ORANGE,
        title: Text("Product list"),
      ),
      body: productlist(),
    );
  }

  Widget productlist() {
    Random rand = new Random();
    return GridView.count(
      childAspectRatio: 1 / 1.2,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(length!, (index) {
        var split = api.split("/");
        var data = split[split.length - 1];
        var price = rand.nextInt(2000);
        return GestureDetector(
          onTap: () {
            // Get.to(() => ProductList(api: home_categories_api[index]));
            Get.to(() => ProductDetail(
                  api: api,
                  name: data,
                  price: price,
                  index: index,
                ));
          },
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(HOME_BORDER_RADIUS)),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      api + "${index}.jpg",
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text("${data}${index}"),
                  Text.rich(TextSpan(
                      text: "Price :",
                      style:
                          TextStyle(color: ORANGE, fontWeight: FontWeight.bold),
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
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
