import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/page/newsdetail.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    NewsApiService _service = NewsApiService();
    _service.getPopularNews();
    popularNews = _service.news;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          controller: _scrollController,
          itemCount: popularNews.length,
          itemBuilder: (context, index) {
            if (index == popularNews.length - 1) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                  child: _buildStackSeeMore());
            } else {
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                  child: _buildStackNews(
                    news: popularNews[index],
                  ));
            }
          }),
    );
  }
}

class _buildStackNews extends StatefulWidget {
  const _buildStackNews({required this.news});

  final Article news;

  @override
  State<StatefulWidget> createState() => _buildStackNewsState();
}

class _buildStackNewsState extends State<_buildStackNews> {
  double _offsetY = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_offsetY == 0) {
            _offsetY = 40; // 下移50
          } else {
            _offsetY = 0; // 回移50
          }
        });
      },
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 150), // 動畫持續時間
              transform: Matrix4.translationValues(0, _offsetY, 0),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 40),
              width: 350,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLookForMoreButton(
                    news: widget.news,
                  ),
                  Text(
                    "${widget.news.title.substring(0, 35)}...",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontFamily: "Consolas",
                    ),
                  ),
                ],
              )),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 0.5),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                widget.news.urlToImage,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------------------------

class _buildStackSeeMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: 350,
          height: 190,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: AppColors.white),
        ),
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 0.5))
            ]),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppColors.white),
                  width: 300,
                  height: 200,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.explore_sharp,
                        color: AppColors.primary,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "See More...",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: "Consolas",
                            fontSize: 25),
                      ),
                    ],
                  )),
            ))
      ],
    );
  }
}

//-------------------------------------------------------------------------------------

class _buildLookForMoreButton extends StatelessWidget {
  final Article news;

  const _buildLookForMoreButton({required this.news});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsDetailPage(
                  news: news,
                )));
      },
      child: const Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "Look for More",
          style: TextStyle(
              color: AppColors.primary, fontFamily: "Consolas", fontSize: 15),
        ),
        Icon(
          Icons.arrow_forward,
          color: AppColors.primary,
        ),
      ]),
    );
  }
}
