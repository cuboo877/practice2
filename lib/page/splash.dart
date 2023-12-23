import 'package:flutter/material.dart';
import 'package:practice2/constant/theme.dart';
import 'package:practice2/page/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _delayToNavHome();
  }

  void _delayToNavHome() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      child: const Image(
        image: AssetImage("assets/icon.png"),
        height: 200,
        width: 200,
      ),
    );
  }
}
