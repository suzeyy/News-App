import 'package:khabar_news_app/models/source_model.dart';

class ArticleModel {
  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author, description, urlToImage, content, title, url, publishedAt;
  SourceModel? source;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? "",
      description: json['description'] ?? "",
      source: json['source'] != null
          ? SourceModel.fromJson(json['source'] as Map<String, dynamic>)
          : SourceModel(),
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
