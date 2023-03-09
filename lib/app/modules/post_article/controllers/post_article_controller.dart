import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewrite_3/app/modules/home/controllers/home_controller.dart';
import 'package:rewrite_3/app/modules/home/models/list_article_model.dart';
import 'package:rewrite_3/app/modules/home/services/list_article_service.dart';
import 'package:rewrite_3/app/modules/post_article/services/post_article_service.dart';

class PostArticleController extends GetxController {
  FocusNode nodeTwo = FocusNode();

  void changeNode(){
    nodeTwo.requestFocus();
  }

  RxBool isLoading = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  HomeController homeController = Get.find<HomeController>();

  String userIdConstant = '11';

  Future<void> postArticleController() async{
    isLoading.toggle();
    try{
      final response = await PostArticleService().postArticleService(title: title.text, desc: desc.text, userId: userIdConstant);
      Logger().d(response);

      await ListArticleService().getListArticleService();
      homeController.refreshListArticle();
      Get.back();
      isLoading.toggle();
      Get.snackbar("Success", "Post Success!");
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
