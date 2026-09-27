import 'package:flutter/material.dart';
import 'package:news_app/data/news_api_model.dart';
import 'package:news_app/view/screens/home_screen.dart';
import '../widgets/image_news.dart';

class ItemCardNews extends StatelessWidget {
  const ItemCardNews({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          ImageNews(image:  article.urlToImage ?? imageNull),
          Text(
            article.author ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            article.title ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
