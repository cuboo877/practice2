import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/service/article_model.dart';
import 'package:practice2/widget/top_app_bar.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final Article news;
  @override
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: NavAppBar(news: widget.news),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.5),
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 0.5),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    widget.news.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Text(
            widget.news.description,
            style: const TextStyle(
                color: AppColors.white, fontFamily: "Consolas", fontSize: 10),
          ),
          const Divider(
            height: 30,
            color: AppColors.white,
          ),
          Text(
            widget.news.content,
            style:
                const TextStyle(color: AppColors.white, fontFamily: "Consolas"),
          )
        ]),
      ),
    );
  }
}
