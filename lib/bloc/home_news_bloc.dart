// news_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_project_github/event/home_news_event.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/state/home_news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsForCategory>(_onFetchNewsForCategory);
  }

  Future<void> _onFetchNewsForCategory(
      FetchNewsForCategory event,
      Emitter<NewsState> emit,
      ) async {
    emit(NewsLoading());
    try {
      final news = await _fetchNewsForCategory(event.categoryId);
      emit(NewsLoaded(news));
    } catch (e) {
      emit(NewsError('Failed to load news'));
    }
  }

  Future<List<HomeNewsModel>> _fetchNewsForCategory(String categoryId) async {
    final response = await http.get(
        Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=3')
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => HomeNewsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}