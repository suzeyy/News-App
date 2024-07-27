import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/constants/string_constants.dart';
import 'package:khabar_news_app/controllers/news_controller.dart';
import 'package:khabar_news_app/controllers/news_tab_controller.dart';
import 'package:khabar_news_app/widgets/news_list_card.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    final newsTabController = Get.put(NewsTabController());
    newsController.getNewsFromApi(
        category: newsTabController.currentSelectedTabValue
            .value); //This calls the news api with current selected tab value the first time it loads
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/khabar-news.png',
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 231, 229, 229),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              size: 20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstants.latest,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  StringConstants.seeAll,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              tabs: newsTabController.tabOptions
                  .map((title) => Tab(text: title))
                  .toList(),
              controller: newsTabController.tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () {
                  if (newsController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: newsController.newsArticlesList.length,
                    itemBuilder: (context, index) {
                      final article = newsController.newsArticlesList[index];
                      return NewsListCard(
                        articleModel: article,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
