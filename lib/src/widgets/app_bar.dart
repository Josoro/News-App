import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../constants/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kBorderAppBar),
                    bottomRight: Radius.circular(kBorderAppBar))),
            title: Text(
              text.toUpperCase(),
              style: kEncodeSansBold.copyWith(
                color: kBlack,
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
              ),
            )));
  }
}
