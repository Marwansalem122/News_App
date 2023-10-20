
import 'dart:convert';
import'package:http/http.dart'as http;
import 'package:news_app/model/slider_model.dart';
class SliderNews{
  List<SliderModel>sliders=[];

  Future<void> getTopNews() async {
    int maxnews=6;
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=3eebf8d9ffbf44e3acfde331f5124a0b");
    var response = await http.get(url);
    var responsebody=jsonDecode(response.body);
    if(responsebody['status']=="ok"){
      int count=0;
      responsebody["articles"].forEach((element){


        if (count < maxnews) { // Check if the maximum number of news articles has been reached
          SliderModel slidemodel=SliderModel(
              title: element["title"],
              author: element["author"],
              url: element["url"],
              publishedAt: element["publishedAt"]
          );
          sliders.add(slidemodel);
          count++; // Increment the counter variable
        }
      });
    }
  }
}
// List<SliderModel>getSliders(){
//   List images=[
//     "business.jpg",
//     "entertainment.jpg",
//     "sports.jpg",
//     "health.jpeg",
//     "technology.jpg",
//     "science.jpg"
//   ];
//   List names=[
//     "اقراء",
//
//   ];
//   List<SliderModel>slider=[];
//
//   for(int i=0;i<images.length;i++){
//     SliderModel slidermodel=SliderModel();
//     slidermodel.name=names[0];
//     slidermodel.image="assets/images/${images[i]}";
//     slider.add(slidermodel);
//   }
//
//   return slider;
// }