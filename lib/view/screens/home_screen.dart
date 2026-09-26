import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  void getArticles() async {
    var newsModel = await ApiManger.getNews();
    articles = newsModel.articles ?? [];
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"), centerTitle: true),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCardNews(article: articles[index]),
        itemCount: articles.length,
      ),
    );
  }
}

String imageNull =
    "https://media.radaronline.com/brand-img/cSJdT1h0C/1200x628/jesse-watters-chinese-president-xi-jinping-donald-trumps-state-dinner-5-1790443148831.jpg";
