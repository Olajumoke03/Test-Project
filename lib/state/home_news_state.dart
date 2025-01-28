// news_state.dart
import 'package:equatable/equatable.dart';
import 'package:test_project_github/model/home_news_model.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsEmpty extends NewsState {}


class NewsLoaded extends NewsState {
  final List<HomeNewsModel> news;

  NewsLoaded(this.news);

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object> get props => [message];
}