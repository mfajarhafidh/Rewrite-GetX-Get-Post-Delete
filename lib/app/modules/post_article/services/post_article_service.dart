import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewrite_3/app/modules/post_article/models/post_article_model_request.dart';

class PostArticleService{
  final _connect = Get.find<GetConnect>();

  Future postArticleService({required String title, required String desc, required String userId}) async{
    final response = await _connect.post(
      'posts', 
      // {
      //   'title': title,
      //   'body': desc,
      //   'userId': 11
      // }
      PostArticleModelRequest(title: title, body: desc, userId: userId).toJson()
      );
    Logger().i(response.statusCode);
    if(!response.hasError){
      return response.body!;
    } else{
      throw Get.snackbar("Error", response.statusCode.toString());
    }
  }
}