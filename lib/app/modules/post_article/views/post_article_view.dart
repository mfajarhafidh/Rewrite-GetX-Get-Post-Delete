import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_article_controller.dart';

class PostArticleView extends GetView<PostArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostArticleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PostArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
