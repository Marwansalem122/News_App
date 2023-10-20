import 'dart:convert';
import'package:http/http.dart'as http;

import '../model/show_category.dart';
class ShowCategoryNew{
  List<ShowCategory>categories=[];

  Future<void> getCategoryNews(String category) async {
    int maxnews=6;
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=${category}&apiKey=3eebf8d9ffbf44e3acfde331f5124a0b");
    var response = await http.get(url);
    var responsebody=jsonDecode(response.body);
    if(responsebody['status']=="ok"){
      int count=0;
      responsebody["articles"].forEach((element){


        if (count < maxnews) { // Check if the maximum number of news articles has been reached
          ShowCategory showcategory=ShowCategory(
              title: element["title"],
              author: element["author"],
              url: element["url"],
              publishedAt: element["publishedAt"]
          );
          categories.add(showcategory);
          count++; // Increment the counter variable
        }
      });
    }
  }
}