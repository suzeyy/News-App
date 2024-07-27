import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/models/article_model.dart';
import 'package:khabar_news_app/models/news_model.dart';
import 'package:khabar_news_app/repository/news_repository.dart';

class NewsController extends GetxController {
  var newsArticlesList = <ArticleModel>[].obs;

  RxBool isLoading = false.obs;
  var newsRepo = NewsRepository();

  // function to retrieve a JSON response for all news from newsApi.org
  getNewsFromApi({required String category}) async {
    try {
      isLoading.value = true;
      final newsResponse = await newsRepo.fetchNews(category);
      if (newsResponse.statusCode == 200) {
        Map<String, dynamic> newsJsonData = jsonDecode(newsResponse.body);
        final newsModel = NewsModel.fromJson(newsJsonData);
        if (newsModel.articles != null) {
          if (newsModel.articles!.isNotEmpty) {
            newsArticlesList.clear();
            newsArticlesList.value = newsModel.articles!;
          }
        }
      } else {
        newsArticlesList.value =
            []; //Return an empty list if no articles fetched
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in News Controller $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
