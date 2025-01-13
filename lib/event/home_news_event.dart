// news_event.dart
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNewsForCategory extends NewsEvent {
  final String categoryId;

  FetchNewsForCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}