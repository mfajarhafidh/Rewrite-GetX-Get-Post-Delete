import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailArticleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
