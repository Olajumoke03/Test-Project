// // news_bloc.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:test_project_github/event/home_news_event.dart';
// import 'package:test_project_github/model/home_news_model.dart';
// import 'package:test_project_github/state/home_news_state.dart';
//
// class NewsBloc extends Bloc<NewsEvent, NewsState> {
//   NewsBloc() : super(NewsInitial()) {
//     on<FetchNewsForCategory>(_onFetchNewsForCategory);
//   }
//
//   Future<void> _onFetchNewsForCategory(
//       FetchNewsForCategory event,
//       Emitter<NewsState> emit,
//       ) async {
//     emit(NewsLoading());
//     try {
//       final news = await _fetchNewsForCategory(event.categoryId);
//       emit(NewsLoaded(news));
//       print("news by category" + news.toString());
//       print("news by category selected" + event.categoryId.toString());
//
//     } catch (e) {
//       emit(NewsError('Failed to load news'));
//     }
//   }
//
//   Future<List<HomeNewsModel>> _fetchNewsForCategory(String categoryId) async {
//     final response = await http.get(
//         Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=3')
//     );
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//
//       print("news by category status code" + response.statusCode.toString());
//       print("news by category" + response.body.toString());
//       return data.map((item) => HomeNewsModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }


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
    if (event.categoryId.isEmpty) {
      emit(NewsError('Invalid category ID'));
      return;
    }

    emit(NewsLoading());

    try {
      final news = await _fetchNewsForCategory(event.categoryId);
      if (news.isEmpty) {
        emit(NewsEmpty());
      } else {
        emit(NewsLoaded(news));
      }
      print('Fetched ${news.length} news items for category ${event.categoryId}');
    } catch (e) {
      print('Error fetching news: $e');
      emit(NewsError('Failed to load news: ${e.toString()}'));
    }
  }

  Future<List<HomeNewsModel>> _fetchNewsForCategory(String categoryId) async {
    // final url = Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=40');
    final url = Uri.parse('https://guardian.ng/wp-json/wp/v2/posts?categories=8&per_page=40');

    print('Fetching news from: $url');


    try {
      final response = await http.get(url);
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => HomeNewsModel.fromJson(item)).toList();
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
      throw Exception('Network error: $e');
    }
  }
}