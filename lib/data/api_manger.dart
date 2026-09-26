import "dart:convert";
import "dart:io";
import "package:http/http.dart" as http;
import "package:news_app/core/api/result_api.dart";
import "package:news_app/data/news_api_model.dart";

class ApiManger {
  static Future<ResultApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "v2/top-headlines", {
        "country": "us",
        "category": "business",
        "apiKey": "380f7dfe50ee478b8a9c987e466182a6",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        return Success(NewsModel.fromJson(json));
      } else {
        return Error("Error from internet Server");
      }
    } on SocketException {
      return Error("Error from internet,try again......");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
