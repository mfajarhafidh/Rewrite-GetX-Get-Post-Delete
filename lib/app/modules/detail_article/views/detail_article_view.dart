import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewrite_3/app/shared/color_schemes/color_scheme.dart';
import 'package:rewrite_3/app/shared/text_styles/text_style.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Detail News',
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
        body: Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(top: 25),
                color: bgColor,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 19, top: 26, bottom: 16, right: 8),
                  child: controller.isLoading.value
                      ? SkeletonListTile()
                      : ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: Text(
                              controller.detailArticle.value.title.toString(),
                              style: headline2,
                            ),
                          ),
                          subtitle: Text(
                            controller.detailArticle.value.body.toString(),
                            style: headline3,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                ),
              ),
            )));
  }
}
