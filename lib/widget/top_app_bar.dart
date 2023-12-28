import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/page/home.dart';
import 'package:practice2/service/article_model.dart';

class NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavAppBar({super.key, required this.news});

  final Article news;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90))),
      title: Text(
        "Content",
        style: const TextStyle(
          fontFamily: "Consolas",
          color: AppColors.primary,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primary,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        },
      ),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shadowColor: AppColors.white,
                      backgroundColor: AppColors.white,
                      alignment: Alignment.center,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Author",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontFamily: "Consolas"),
                          ),
                          Text(
                            "${news.author}",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontFamily: "Consolas",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Publish At",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontFamily: "Consolas"),
                          ),
                          Text(
                            "${news.publishAt.replaceAll("T", " ").replaceAll("Z", " ")}",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontFamily: "Consolas",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primary,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
