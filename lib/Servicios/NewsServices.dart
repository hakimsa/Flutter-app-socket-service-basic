import 'package:flutter/foundation.dart';
import 'package:iaxpp/Models/NewModel.dart';
import 'package:http/http.dart' as http;

final _NEWSURL = "http://newsapi.org/v2";
final _APIKEY = "7fcfa13af3e84947b336ad0b86585075";

class NewsServices with ChangeNotifier {
  final List<Article> handleans = [];

  NewsServices() {
    this.getTopHeadlines();
  }
  Future<List<Article>> getTopHeadlines() async {
    var url =
        '$_NEWSURL/everything?q=bitcoin&from=2020-10-07&sortBy=publishedAt&apiKey=$_APIKEY';
    var response = await http.get(url);
    final newsresponse = newsReponsFromJson(response.body);
    this.handleans.addAll(newsresponse.articles.toList());
    print(handleans[0].title);
    print(handleans[0].description);
    print(handleans[0].urlToImage);
    ChangeNotifier();
    return handleans;
  }
}
