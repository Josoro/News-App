import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/repositories/news_repository.dart';

import '../../models/news_model.dart';

part 'news_api_event.dart';
part 'news_api_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await _newsRepository.fetchNews();
        emit(NewsLoadedState(news));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}
