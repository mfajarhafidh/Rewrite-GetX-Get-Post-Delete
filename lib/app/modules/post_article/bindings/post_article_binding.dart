import 'package:get/get.dart';
import 'package:rewrite_3/app/modules/home/controllers/home_controller.dart';

import '../controllers/post_article_controller.dart';

class PostArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostArticleController>(
      () => PostArticleController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
