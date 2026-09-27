import 'package:flutter/material.dart';
import 'package:news_app/data/news_api_model.dart';
import 'package:news_app/view/widgets/image_news.dart';
import 'package:news_app/view/screens/home_screen.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(title: Text("Details News"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 15,
            children: [
              ImageNews(image: article.urlToImage ?? imageNull, height: 300),
              Text(
                article.description ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                article.title ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                article.content ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
