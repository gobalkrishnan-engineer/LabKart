import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';

popUp() {
  double size = 60.0;
  return showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Container(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        SocialShare.shareInstagramStory(
                          "",
                          backgroundTopColor: "#ffffff",
                          backgroundBottomColor: "#000000",
                          attributionURL: "https://deep-link-url",
                        );
                      },
                      child: Image.asset(
                        "assets/icons/whatsapp.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/gmail.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/smartphone.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/twitter.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/instagram.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/linkedin.png",
                        width: size,
                        height: size,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        );
      });
}
