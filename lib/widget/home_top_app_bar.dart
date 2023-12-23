import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90))),
      title: const Text(
        "Home",
        style: TextStyle(
            fontFamily: "Consolas",
            color: AppColors.primary,
            fontSize: 20,
            letterSpacing: 4),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_sharp,
          color: AppColors.primary,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
