import 'package:get/get.dart';
import 'package:rewrite_3/app/modules/detail_article/models/detail_article_model.dart';

class DetailArticleService{
  final _connect = Get.find<GetConnect>();

  Future<DetailArticleModel> getDetailArticle({required String id}) async{
    final response = await _connect.get('posts/$id',
    decoder: (data) => DetailArticleModel.fromJson(data));
    if(!response.hasError){
      return response.body!;
    } else{
      throw Get.snackbar("Error", response.statusCode.toString());
    }
  }
}