import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/theme/theme.dart';

class ProductList extends StatelessWidget {
  var api;
  int? length;
  ProductList({Key? key, this.api, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product list"),
        ),
        body: productlist());
  }

  Widget productlist() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(
          length!,
          (index) => GestureDetector(
                onTap: () {
                  // Get.to(() => ProductList(api: home_categories_api[index]));
                },
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(HOME_BORDER_RADIUS)),
                    elevation: 5,
                    child: Image.network(
                      api + "${index}.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )),
    );
  }
}
