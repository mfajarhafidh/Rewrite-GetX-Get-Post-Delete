import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewrite_3/app/modules/home/models/list_article_model.dart';
import 'package:rewrite_3/app/modules/home/services/list_article_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ListArticleModel> listArticle = <ListArticleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListArticle();
  }

  Future<void> getListArticle() async{
    isLoading.toggle();
    try{
      final response = await ListArticleService().getListArticleService();
      listArticle.addAll(response.reversed);
      isLoading.toggle();
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }

  Future deleteArticle(val) async{
    isLoading.toggle();
    try{
      final response = await ListArticleService().deleteArticleService(id: val);
      Logger().d(response);
      final res = await ListArticleService().getListArticleService();
      listArticle.addAll(res);
      isLoading.toggle();
      Get.snackbar("Deleted", "You have deleted article!");
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
