import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice2/service/article_model.dart';

class NewsApiService {
  List<Article> news = [];
  String apiKey = '122b0fe1da9d45c7acbd67be7662aeb8';
  Future<void> getNews({String? q, int? size}) async {
    news = [];
    String url =
        'https://newsapi.org/v2/everything?q=${q ?? "news"}&pageSize=${size ?? 100}&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
              element['title'] ?? "",
              element['author'] ?? "",
              element['description'] ?? "",
              element['url'] ?? "",
              element['urlToImage'] ?? "",
              element['publishAt'] ?? "",
              element['content'] ?? "");
          news.add(article);
        }
      });
    }
  }

  Future<void> getPopularNews({String? q, int? size}) async {
    news = [];
    String url =
        'https://newsapi.org/v2/everything?q=${q ?? "news"}&sortBy=popularity&pageSize=${size ?? 100}&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
              element['title'] ?? "",
              element['author'] ?? "",
              element['description'] ?? "",
              element['url'] ?? "",
              element['urlToImage'] ?? "",
              element['publishAt'] ?? "",
              element['content'] ?? "");
          news.add(article);
        }
      });
    }
  }
}
