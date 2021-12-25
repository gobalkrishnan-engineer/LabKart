import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labkart/pages/product_list.dart';
import 'package:labkart/services/api_url.dart';
import 'package:labkart/theme/theme.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: HOME_HORIZONTAL_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LabKart",
                style: TextStyle(
                    color: ORANGE,
                    fontSize: HOME_FONTSIZE,
                    fontFamily: "Arial"),
              ),
              Text("Enjoy the LabKart product"),
              SizedBox(
                height: 100,
              ),
              categories(),
              SizedBox(
                height: 100,
              ),
              Text("  copyright@ 2021")
            ],
          )),
    );
  }

  List home_categories = [
    ApiUrl.ELECTRONIC + "19.jpg",
    ApiUrl.MEN + "19.jpg",
    ApiUrl.WOMEN + "8.jpg",
    ApiUrl.KID + "6.jpg",
  ];
  List home_categories_api = [
    ApiUrl.ELECTRONIC,
    ApiUrl.MEN,
    ApiUrl.WOMEN,
    ApiUrl.KID,
  ];

  List name = ["Electronic", "Men Shirt/Pant", "Women Shirt/Pant", "Kid toy"];
  Widget categories() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(
          home_categories.length,
          (index) => GestureDetector(
                onTap: () {
                  Get.to(() => ProductList(
                        api: home_categories_api[index],
                        length: ApiUrl.list_length[index],
                      ));
                },
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(HOME_BORDER_RADIUS)),
                    elevation: 5,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            home_categories[index],
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${name[index]}")
                        ]),
                  ),
                ),
              )),
    );
  }
}
