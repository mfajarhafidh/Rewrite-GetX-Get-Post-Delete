import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:rewrite_3/app/shared/color_schemes/color_scheme.dart';
import 'package:rewrite_3/app/shared/text_styles/text_style.dart';

import '../controllers/post_article_controller.dart';

class PostArticleView extends GetView<PostArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'StarNews',
            style: headline1,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                "Judul",
                style: headline2,
              ),
              Gap(10),
              TextField(
                style: headline2,
                controller: controller.title,
                onSubmitted: (val) => controller.changeNode(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: bgColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
              Gap(25),
              Text(
                "Content Article",
                style: headline2,
              ),
              Gap(10),
              TextField(
                style: headline3,
                controller: controller.desc,
                focusNode: controller.nodeTwo,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: bgColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                maxLines: 10,
              ),
              Gap(100),
              Obx(() => GestureDetector(
                    onTap: () => controller.isLoading.value ? null : controller.postArticleController(),
                    child: Container(
                      height: 57,
                      width: 301,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: bgColor),
                      child: Center(
                          child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Text(
                        "Post",
                        style: headline2,
                      )),
                    ),
                  ))
            ],
          ),
        ));
  }
}
