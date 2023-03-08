import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewrite_3/app/modules/home/models/list_article_model.dart';

class ListArticleService{
  final _connect = Get.find<GetConnect>();

  Future<List<ListArticleModel>> getListArticleService() async{
    final response = await _connect.get('posts',
    decoder: (data) => List<ListArticleModel>.from(data.map((x) => ListArticleModel.fromJson(x))));
    if(!response.hasError){
      return response.body!;
    } else{
      throw Get.snackbar("Error", response.statusCode.toString());
    }
  }
}