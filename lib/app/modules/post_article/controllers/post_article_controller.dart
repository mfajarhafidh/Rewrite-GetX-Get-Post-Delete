import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewrite_3/app/modules/home/models/list_article_model.dart';
import 'package:rewrite_3/app/modules/home/services/list_article_service.dart';
import 'package:rewrite_3/app/modules/post_article/services/post_article_service.dart';

class PostArticleController extends GetxController {
  FocusNode nodeTwo = FocusNode();

  void changeNode(){
    nodeTwo.requestFocus();
  }

  RxBool isLoading = false.obs;
  final title = TextEditingController();
  final desc = TextEditingController();

  RxList<ListArticleModel> listArticle = <ListArticleModel>[].obs;

  Future<void> postArticleController() async{
    isLoading.toggle();
    try{
      final response = await PostArticleService().postArticleService(title: title.text, desc: desc.text);
      Logger().d(response);
      final res = await ListArticleService().getListArticleService();
      listArticle.addAll(res.reversed);
      Get.back();
      isLoading.toggle();
      Get.snackbar("Success", "Post Success!");
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
