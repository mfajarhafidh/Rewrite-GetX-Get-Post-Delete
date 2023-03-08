import 'package:get/get.dart';
import 'package:rewrite_3/app/modules/detail_article/models/detail_article_model.dart';
import 'package:rewrite_3/app/modules/detail_article/services/detail_article_service.dart';

class DetailArticleController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DetailArticleModel> detailArticle = DetailArticleModel().obs;
  String id = '';

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    getDetailArticleController();
  }

  Future<void> getDetailArticleController() async{
    isLoading.toggle();
    try{
      final response = await DetailArticleService().getDetailArticle(id: id);
      detailArticle(response);
      isLoading.toggle();
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
