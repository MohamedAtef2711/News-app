import 'package:news_app/data/news_api_model.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  List<Article> articles;
  NewsSuccess(this.articles);
}

class NewsError extends NewsState {
  String errorMessage;
  NewsError(this.errorMessage);
}
