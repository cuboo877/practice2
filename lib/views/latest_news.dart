import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/service/api_service.dart';
import 'package:practice2/service/article_model.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  State<StatefulWidget> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  late List<Article> news = [];
  late List<Article> latestNews = [];

  @override
  void initState() {  
    NewsApiService _service = NewsApiService();
    _service.getNews();
    latestNews = _service.news;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
          children: latestNews.map((e) {
        return _buildTile(e);
      }).toList()),
    );
  }
}

Widget _buildTile(Article news) {
  return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                news.urlToImage,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              news.title,
              style: const TextStyle(
                  color: AppColors.white, fontFamily: "Consolas"),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right,
                color: AppColors.white,
              )),
        ]),
      ));
}

Widget _buildYeeeee() {
  return InkWell(
    onTap: () {
      // Handle the tap event here
      print('Custom ListTile Clicked');
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Icon(Icons.android), // Replace this with your desired icon
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Custom ListTile Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Subtitle'),
              ],
            ),
          ),
          Icon(Icons
              .arrow_forward), // Replace this with your desired trailing icon
        ],
      ),
    ),
  );
}
