import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Initializer{
  static Future init() async{
    _initGetConnect();
  }

  static Future<void> _initGetConnect() async{
    final connect = GetConnect();
    connect.baseUrl = 'https://jsonplaceholder.typicode.com/';
    Logger().d(connect.baseUrl);
    Get.put(connect);
  }
}