import 'package:khabar_news_app/models/article_model.dart';

class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    totalResults = json['totalResults'] ?? 0;
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles!.add(ArticleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
