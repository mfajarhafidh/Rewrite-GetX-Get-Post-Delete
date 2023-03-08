import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PostArticleService{
  final _connect = Get.find<GetConnect>();

  Future postArticleService({required String title, required String desc}) async{
    final response = await _connect.post(
      'posts', {
        'title': title,
        'body': desc,
        'userId': 11
      });
    Logger().i(response.statusCode);
    if(!response.hasError){
      return response.body!;
    } else{
      throw Get.snackbar("Error", response.statusCode.toString());
    }
  }
}