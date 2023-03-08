import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewrite_3/app/routes/app_pages.dart';
import 'package:rewrite_3/app/shared/text_styles/text_style.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/icon_splash.png'),
      title: Text("StarNews", style: headline1.copyWith(fontSize: 36)),
      navigator: Routes.HOME,
    );
  }
}
