import 'package:test_project_github/model/home_news_model.dart';

abstract class TopNewsState {}

class TopNewsInitialState extends TopNewsState {}

class TopNewsLoadingState extends TopNewsState {}

class TopNewsLoadedState extends TopNewsState {
  final List<HomeNewsModel> news;
  TopNewsLoadedState(this.news);
}

class TopNewsErrorState extends TopNewsState {
  final String message;
  TopNewsErrorState(this.message);
}