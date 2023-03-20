import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/widgets/app_bar.dart';

import '../../bloc/bloc/news_api_bloc.dart';
import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../models/news_model.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = '/details';
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      appBar: CustomAppBar(text: 'Details'),
      body: BodyDetails(),
    );
  }
}

class BodyDetails extends StatefulWidget {
  const BodyDetails({super.key});

  @override
  State<BodyDetails> createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
              'Hola maefccccccccccccccccccccccccccccccccccccccccccccefvvfsdvdcscv'),
          const SizedBox(height: 20),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.indigo,
                  ),
                );
              }
              if (state is NewsLoadedState) {
                List<NewsModel> articleDetails = state.newss;
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius),
                      topRight: Radius.circular(kBorderRadius),
                      bottomLeft: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius)),
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: SizeConfig.screenHeight! * 0.4,
                  ),
                );
                const SizedBox(height: 20);
                const Text('assets/images/no-image.png');
              }
              if (state is NewsErrorState) {
                return Center(child: Text(state.error));
              }

              return Container();
            },
          )
        ]));
  }
}
