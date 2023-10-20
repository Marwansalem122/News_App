import 'dart:convert';
import'package:http/http.dart'as http;
import 'package:news_app/model/article_model.dart';

class News{
  List<ArticleModel>news=[];
  Future<void> getNews() async {
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=3eebf8d9ffbf44e3acfde331f5124a0b");
    var response = await http.get(url);
   var responsebody=jsonDecode(response.body);
     if(responsebody['status']=="ok"){
        responsebody["articles"].forEach((element){
          ArticleModel articlemodel=ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            publishedAt: element["publishedAt"]
          );
          news.add(articlemodel);

        });
     }
  }
}