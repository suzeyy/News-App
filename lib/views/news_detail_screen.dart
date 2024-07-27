import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khabar_news_app/constants/color_constants.dart';
import 'package:khabar_news_app/models/article_model.dart';

class NewsDetailScreen extends StatelessWidget {
  late ArticleModel articleModel;

  NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    articleModel = Get.arguments ?? ArticleModel();
    String convertedDate = DateFormat.yMd().format(DateTime.now());
    if (articleModel.publishedAt != null) {
      DateTime parsedDate = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
          .parseUTC(articleModel.publishedAt!);
      convertedDate =
          "${parsedDate.year}-${parsedDate.month}-${parsedDate.day}";
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {
              // Add your share logic here
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(articleModel.urlToImage ?? ""),
              ),
              title: Text(articleModel.source?.name ?? 'BBC News'),
              subtitle: Text(convertedDate),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  backgroundColor: AppColors.blue0982BA,
                ),
                onPressed: () {},
                child: Text(
                  'Following',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CachedNetworkImage(
              imageUrl: articleModel.urlToImage ?? "",
              placeholder: (context, url) => const SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleModel.title ?? "News Title",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleModel.description ??
                    "This is a sample description as the original description is unable to load",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
