import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/controllers/news_controller.dart';

class NewsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final List<String> tabOptions = [
    'All',
    'Sports',
    'Politics',
    'Business',
    'Health',
    'Travel',
    'Science'
  ];
  RxString currentSelectedTabValue = "".obs;

  @override
  void onInit() {
    tabController = TabController(length: tabOptions.length, vsync: this);
    tabController.addListener(_handleTabChange);
    currentSelectedTabValue.value = tabOptions.first;

    ///Selecting the first value of tab as default filter category
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    tabController.removeListener(_handleTabChange);

    super.onClose();
  }

  _handleTabChange() {
    final newsController = Get.find<NewsController>();
    currentSelectedTabValue.value = tabOptions[tabController.index];
    newsController.getNewsFromApi(category: currentSelectedTabValue.value);
  }
}
