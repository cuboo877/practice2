import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/service/article_model.dart';
import 'package:practice2/views/popular_news.dart';
import 'package:practice2/widget/home_top_app_bar.dart';
import 'package:practice2/widget/nav_drawer.dart';
import 'package:practice2/service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> newsList = [];
  @override
  void initState() {
    NewsApiService _service = NewsApiService();
    _service.getNews();
    newsList = _service.news;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [PopularNews()],
        ),
      ),
      backgroundColor: AppColors.primary,
      appBar: const HomeAppBar(),
      drawer: const NavDrawer(),
    );
  }
}
