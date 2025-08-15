

import '../../features/home/data/model/data_model.dart';

abstract class AppState {}

class NewsInitial extends AppState {}

class NewsLoading extends AppState {}
class BottomNavigationBarState extends AppState {}
class ChangeBorderColorState extends AppState {}
class NewsLoaded extends AppState {
  final Response news;
  NewsLoaded(this.news);
}

class NewsError extends AppState {
  final String message;
  NewsError(this.message);
}
