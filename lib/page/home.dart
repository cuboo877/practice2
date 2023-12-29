import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/views/latest_news.dart';
import 'package:practice2/views/popular_news.dart';
import 'package:practice2/widget/home_top_app_bar.dart';
import 'package:practice2/widget/nav_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scrollbar(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopularNews(),
            LatestNews(),
          ],
        ),
      )),
      backgroundColor: AppColors.primary,
      appBar: HomeAppBar(),
      drawer: NavDrawer(),
    );
  }
}
