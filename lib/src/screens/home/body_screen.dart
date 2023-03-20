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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/details');
                    },
                    child: Container(
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
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(kBorderRadius),
                                bottomLeft: Radius.circular(kBorderRadius)),
                            child: SizedBox(
                              width: SizeConfig.screenWidth! * 0.5,
                              height: SizeConfig.screenHeight! * 0.20,
                              child: (articleList[index].urlToImage != null)
                                  ? FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/images/giphy.gif'),
                                      fit: BoxFit.cover,
                                      image: NetworkImage(articleList[index]
                                          .urlToImage
                                          .toString()))
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/no-image.png'),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenHeight! * 0.01),
                          Container(
                              height: SizeConfig.screenHeight! * 0.15,
                              width: SizeConfig.screenWidth! * 0.4,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.screenHeight! * 0.01),
                              child: Text(
                                articleList[index].title.toString(),
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    color: kBlack, fontSize: 14),
                              )),
                        ])),
                  );
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
