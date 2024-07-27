import 'package:http/http.dart' as http;
import 'package:khabar_news_app/constants/news_api_constants.dart';

class NewsRepository {
  Future<dynamic> fetchNews(String category) async {
    String url = "";

    if (category.isNotEmpty && category.toLowerCase() != "all") {
      url =
          '${NewsApiConstants.baseUrl}top-headlines?q=$category&languages=en&apiKey=${NewsApiConstants.newsApiKey}';
    } else {
      url =
          '${NewsApiConstants.baseUrl}everything?domains=techcrunch.com,thenextweb.com&languages=en&apiKey=${NewsApiConstants.newsApiKey}';
    }

    return await http.get(Uri.parse(url));
  }
}
