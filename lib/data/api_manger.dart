
import "dart:convert";
import "package:http/http.dart" as http;
import "package:news_app/data/news_api_model.dart";

class ApiManger {
  static Future<NewsModel> getNews() async {
    Uri url = Uri.https("newsapi.org", "v2/top-headlines", {
      "country": "us",
      "category": "business",
      "apiKey": "380f7dfe50ee478b8a9c987e466182a6",
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }
}