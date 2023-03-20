import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/src/models/news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

    var data = jsonDecode(response.body);

    List<NewsModel> articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        NewsModel artcileModel = NewsModel.fromJson(item);
        articleModelList.add(artcileModel);
      }
      return articleModelList;
    } else {
      return articleModelList; // empty list
    }
  }
}
