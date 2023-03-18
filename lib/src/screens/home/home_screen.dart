import 'package:flutter/material.dart';
import 'package:news_app/src/constants/size_config.dart';

import '../../constants/styles.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppbar(),
      body: const BodyScreen(),
    );
  }
}

AppBar buildAppbar() => AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kBorderAppBar),
            bottomRight: Radius.circular(kBorderAppBar))),
    title: Text(
      'News'.toUpperCase(),
      style: kEncodeSansBold.copyWith(
        color: kBlack,
        fontSize: SizeConfig.blockSizeHorizontal! * 5,
      ),
    ));
