import 'package:flutter/material.dart';
import 'package:news_app/src/constants/size_config.dart';
import 'package:news_app/src/screens/home/body_screen.dart';
import 'package:news_app/src/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      appBar: CustomAppBar(text: 'News'),
      body: BodyScreen(),
    );
  }
}
