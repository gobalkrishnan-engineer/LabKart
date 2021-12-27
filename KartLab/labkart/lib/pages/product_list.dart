import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/component/pop_up.dart';
import 'package:labkart/controller/cart_controller.dart';
import 'package:labkart/pages/cart_product.dart';
import 'package:labkart/pages/product_details.dart';
import 'package:labkart/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cart_list.dart';

class ProductList extends StatelessWidget {
  var api;
  int? length;
  ProductList({Key? key, this.api, this.length}) : super(key: key);

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
              icon: Icon(
                Icons.notification_add,
              )),
          Align(
              alignment: Alignment.center,
              child:
                  Obx(() => Text("${cartController.cartList.value.length}"))),
          SizedBox(width: 20)
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
                      api + "${index}.jpg" + "?dummy=$index",
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
                          onPressed: () {
                            CartDetail cartdetail = CartDetail(
                                api: api,
                                name: data,
                                price: price,
                                index: index);
                            cartController.cartList.add(cartdetail);
                            cartController.total.value += price;
                          },
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.orange,
                          )),
                      IconButton(
                          onPressed: () {
                            //openwhatsapp();
                            // launch(url());
                            popUp();
                          },
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

  openwhatsapp() async {
    var whatsapp = "+918148729703";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  String url() {
    var phone = "8148729703";
    var message = "Please, God find my wife.";
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
    }
  }
}
