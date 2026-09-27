import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/news_api_model.dart';
import 'package:news_app/view/widgets/item_card.dart';
import 'package:news_app/view_model/news_cubit.dart';
import 'package:news_app/view_model/news_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getArticles(),
      child: Scaffold(
        appBar: AppBar(title: Text("News"), centerTitle: true),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsSuccess) {
              return _successView(state.articles);
            }
            if (state is NewsError) {
              return _errorView(state.errorMessage);
            }
            return _isLoading();
          },
        ),
      ),
    );
  }

  Widget _successView(List<Article> articles) {
    return ListView.builder(
      itemBuilder: (context, index) => ItemCardNews(article: articles[index]),
      itemCount: articles.length,
    );
  }

  Widget _isLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _errorView(String error) {
    return Center(
      child: Text(error, style: TextStyle(fontSize: 30, color: Colors.red)),
    );
  }
}

String imageNull =
    "https://media.radaronline.com/brand-img/cSJdT1h0C/1200x628/jesse-watters-chinese-president-xi-jinping-donald-trumps-state-dinner-5-1790443148831.jpg";
