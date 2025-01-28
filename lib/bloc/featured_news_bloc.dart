// lib/blocs/news/news_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_github/event/featured_news_event.dart';
import 'package:test_project_github/repository/news_repository.dart';
import 'package:test_project_github/state/featured_news_state.dart';

class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  final NewsRepository repository;

  TopNewsBloc({required this.repository}) : super(TopNewsInitialState()) {
    on<FetchTopNewsEvent>(_onFetchNews);
    on<RefreshTopNewsEvent>(_onRefreshTopNews);
  }

  Future<void> _onFetchNews(FetchTopNewsEvent event, Emitter<TopNewsState> emit) async {
    emit(TopNewsLoadingState());
    try {
      final news = await repository.fetchTopNews();
      emit(TopNewsLoadedState(news));
    } catch (e) {
      emit(TopNewsErrorState(e.toString()));
    }
  }

  Future<void> _onRefreshTopNews(RefreshTopNewsEvent event, Emitter<TopNewsState> emit) async {
    try {
      final news = await repository.fetchTopNews();
      emit(TopNewsLoadedState(news));
    } catch (e) {
      emit(TopNewsErrorState(e.toString()));
    }
  }
}