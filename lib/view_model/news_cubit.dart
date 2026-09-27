import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/news_state.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/data/news_api_model.dart';
import 'package:news_app/core/api/result_api.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsLoading());
  
  void getArticles() async {
    emit(NewsLoading());
    final result = await ApiManger.getNews();
    switch (result) {
      case Success<NewsModel>():
        var articles = result.data.articles ?? [];
        emit(NewsSuccess(articles));
      case Error<NewsModel>():
        var error = result.errorMessage;
        emit(NewsError(error));
    }
  }
}
