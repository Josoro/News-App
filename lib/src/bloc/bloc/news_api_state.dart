part of 'news_api_bloc.dart';

@immutable
abstract class NewsState {}

//Data Loading State.
class NewsLoadingState extends NewsState {}

//Data Loaded State.
class NewsLoadedState extends NewsState {
  final List<NewsModel> newss;
  NewsLoadedState(this.newss);
}

//Data Error State.
class NewsErrorState extends NewsState {
  final String error;
  NewsErrorState(this.error);
}
