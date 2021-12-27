import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/controller/cart_controller.dart';
import 'package:labkart/theme/theme.dart';

import 'cart_product.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
        backgroundColor: ORANGE,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          listData(),
          cartController.total.value == 0.0
              ? Container()
              : Container(
                  padding: EdgeInsets.all(10),
                  width: Get.width,
                  height: 100,
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: ORANGE),
                        onPressed: () {},
                        child: Text("Buy"),
                      ),
                      title: Center(
                        child: Text.rich(TextSpan(
                            text: "Total Price : ",
                            style: TextStyle(
                                color: ORANGE, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: "${cartController.total.value} Rs/-",
                                  style: TextStyle(color: Colors.black))
                            ])),
                      ),
                    ),
                  ),
                )
        ]),
      ),
    );
  }

  Widget listData() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cartController.cartList.value.length,
          itemBuilder: (context, index) {
            CartDetail cartDetail = cartController.cartList.value[index];
            var image = "${cartDetail.api}${cartDetail.index}.jpg?dummy=$index";
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          cartController.cartList.value.removeAt(index);
                          cartController.total.value -= cartDetail.price;

                          Get.forceAppUpdate();
                          print("--<");
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    title: Row(
                      children: [
                        Image.network(
                          image,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text("${cartDetail.name}${index}"),
                            SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(
                                text: "Price :",
                                style: TextStyle(
                                    color: ORANGE, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: "${cartDetail.price} Rs/-",
                                      style: TextStyle(color: Colors.black))
                                ])),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
