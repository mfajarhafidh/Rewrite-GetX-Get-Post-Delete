import 'package:get/get.dart';
import 'package:rewrite_3/app/modules/home/models/list_article_model.dart';
import 'package:rewrite_3/app/modules/home/services/list_article_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ListArticleModel> listArticle = <ListArticleModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListArticle();
  }

  Future<void> getListArticle() async{
    isLoading.toggle();
    try{
      final response = await ListArticleService().getListArticleService();
      listArticle.addAll(response);
      isLoading.toggle();
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
