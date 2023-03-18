part of 'news_api_bloc.dart';

@immutable
abstract class NewsEvent {
  const NewsEvent();
}

class LoadUserEvent extends NewsEvent {}
