import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khabar_news_app/constants/route_constants.dart';
import 'package:khabar_news_app/models/article_model.dart';

class NewsListCard extends StatelessWidget {
  NewsListCard({
    super.key,
    required this.articleModel,
  });

  ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    String convertedDate = DateFormat.yMd().format(DateTime.now());
    if (articleModel.publishedAt != null) {
      DateTime parsedDate = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
          .parseUTC(articleModel.publishedAt!);
      convertedDate =
          "${parsedDate.year}-${parsedDate.month}-${parsedDate.day}";
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteConstants.newsDetail, arguments: articleModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: articleModel.urlToImage!,
                placeholder: (context, url) => const SizedBox(
                    width: 30, height: 30, child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleModel.author ?? "Country",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      articleModel.title ?? "News Title",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    articleModel.description != null
                        ? Text(
                            articleModel.description!,
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: articleModel.urlToImage != null
                              ? NetworkImage(articleModel.urlToImage!)
                              : const AssetImage(
                                  'assets/images/khabar-news.png'),
                          radius: 10.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          articleModel.source?.name ?? "News Source",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(Icons.timer, size: 15),
                        const SizedBox(width: 8.0),
                        Text(
                          convertedDate,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
