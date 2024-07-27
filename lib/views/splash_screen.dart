import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/constants/color_constants.dart';
import 'package:khabar_news_app/constants/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      //navigate to home screen replacing the view
      Get.offAndToNamed(RouteConstants.newsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Image.asset(
        'assets/images/khabar-news.png',
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
      )),
    );
  }
}
