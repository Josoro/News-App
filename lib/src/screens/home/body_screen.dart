import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/constants/size_config.dart';
import 'package:news_app/src/models/news_model.dart';

import '../../bloc/bloc/news_api_bloc.dart';
import '../../constants/styles.dart';

class BodyScreen extends StatefulWidget {
  static String routeName = '/body';
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        color: kWhite,
        margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.01),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.indigo,
                ),
              );
            }
            if (state is NewsLoadedState) {
              List<NewsModel> articleList = state.newss;

              return ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (contex, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                color: kGrey,
                                offset: Offset(0, 1),
                                spreadRadius: 1)
                          ]),
                      height: SizeConfig.screenHeight! * 0.20,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight! * 0.01,
                        top: SizeConfig.screenHeight! * 0.01,
                        left: SizeConfig.screenWidth! * 0.02,
                        right: SizeConfig.screenWidth! * 0.02,
                      ),
                      child: Row(children: <Widget>[
                        Container(
                          width: SizeConfig.screenWidth! * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(kBorderRadius),
                                  bottomLeft: Radius.circular(kBorderRadius)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    articleList[index].urlToImage.toString(),
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: SizeConfig.screenHeight! * 0.03),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.screenHeight! * 0.01),
                          child: const Column(
                            children: [
                              Text(
                                'hola',
                                style: TextStyle(color: kBlack, fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ]));
                },
              );
            }

            if (state is NewsErrorState) {
              return Center(child: Text(state.error));
            }

            return Container();
          },
        ));
  }
}
