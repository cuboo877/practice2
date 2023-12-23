import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/service/api_service.dart';
import 'package:practice2/service/article_model.dart';

class PopularNews extends StatefulWidget {
  const PopularNews({super.key});

  @override
  State<StatefulWidget> createState() => _PopularNewsState();
}

class _PopularNewsState extends State<PopularNews> {
  late List<Article> news = [];
  late List<Article> popularNews = [];

  @override
  void initState() {
    super.initState();
    _fetchPopularNews();
  }

  Future<void> _fetchPopularNews() async {
    NewsApiService _service = NewsApiService();
    await _service.getPopularNews();
    setState(() {
      popularNews = _service.news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        itemCount: popularNews.length,
        itemBuilder: (context, index) {
          _buildStackNews(
            news: popularNews[index],
          );
        });
  }
}

class _buildStackNews extends StatefulWidget {
  const _buildStackNews({required this.news});

  final Article news;
  @override
  State<StatefulWidget> createState() => _buildStackNewsState();
}

class _buildStackNewsState extends State<_buildStackNews> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 250,
          height: 420,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: AppColors.white),
        ),
        Image.network(widget.news.urlToImage, width: 200, height: 400)
      ],
    );
  }
}
