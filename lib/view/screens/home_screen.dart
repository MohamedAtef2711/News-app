import 'package:flutter/material.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/data/news_api_model.dart';
import 'package:news_app/view/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  String? error;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"), centerTitle: true),
      body: isLoading
          ? _isLoading()
          : error != null
          ? _errorView()
          : _successView(),
    );
  }

  Widget _successView() {
    return ListView.builder(
      itemBuilder: (context, index) => ItemCardNews(article: articles[index]),
      itemCount: articles.length,
    );
  }

  Widget _isLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _errorView() {
    return Center(
      child: Text(error!, style: TextStyle(fontSize: 30, color: Colors.red)),
    );
  }

  void getArticles() async {
    var result = await ApiManger.getNews();
    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];
      case Error<NewsModel>():
        error = result.errorMessage;
    }
    isLoading = false;
    setState(() {});
  }
}

String imageNull =
    "https://media.radaronline.com/brand-img/cSJdT1h0C/1200x628/jesse-watters-chinese-president-xi-jinping-donald-trumps-state-dinner-5-1790443148831.jpg";
