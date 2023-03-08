import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewrite_3/app/routes/app_pages.dart';
import 'package:rewrite_3/app/shared/color_schemes/color_scheme.dart';
import 'package:rewrite_3/app/shared/text_styles/text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('StarNews', style: headline1,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() => ListView.builder(
                  itemCount: controller.listArticle.length,
                  itemBuilder: (BuildContext context, int index) { 
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      margin: EdgeInsets.only(top: 25),
                      color: bgColor,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19, top: 26, bottom: 16, right: 8),
                        child: ListTile(
                          onTap: () => Get.toNamed(Routes.DETAIL_ARTICLE, arguments: {'id': controller.listArticle[index].id.toString()}),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: Text(controller.listArticle[index].title.toString(), style: headline2, overflow: TextOverflow.ellipsis, maxLines: 1,),
                  ),
                  subtitle: Text(controller.listArticle[index].body.toString(), style: headline3, overflow: TextOverflow.ellipsis, maxLines: 3,),
                ),
              ),
            );
           },
        ),
      ))
    );
  }
}
