import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/page/home.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  Widget _buildDrawerListTile(
      String title, IconData? icon, BuildContext context, Widget navTarget) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage())),
      title: Text(
        title,
        style:
            const TextStyle(color: AppColors.primary, fontFamily: "Consolas"),
      ),
      iconColor: AppColors.primary,
      leading: IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => navTarget)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: AppColors.white),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  centerTitle: true,
                  title: const Text(
                    "Menu",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontFamily: "Consolas",
                        letterSpacing: 4),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Divider(
                  color: AppColors.primary,
                  thickness: 1,
                  indent: 14,
                  endIndent: 14,
                ),
                _buildDrawerListTile(
                    "Home", Icons.home, context, const HomePage()),
                _buildDrawerListTile("Account", Icons.account_circle_rounded,
                    context, const HomePage()),
                _buildDrawerListTile(
                    "Setting", Icons.settings, context, const HomePage()),
                _buildDrawerListTile(
                    "About", Icons.info, context, const HomePage()),
                _buildDrawerListTile("Exit", Icons.exit_to_app_outlined,
                    context, const HomePage()),
              ]),
        ));
  }
}
