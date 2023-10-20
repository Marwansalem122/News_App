import 'package:flutter/material.dart';
import 'package:news_app/pages/show_category_news.dart';

import '../model/article_model.dart';
import '../model/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
class AllNews extends StatefulWidget {
  String? news;
   AllNews({
     super.key,
     required this.news
   });

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders=[];
  List<ArticleModel>articles=[];
  bool loading=true;
  getnews()async{
    News classnew=News();
    await classnew.getNews();
    articles=classnew.news;
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    getslidernews();
    getnews();

    super.initState();
  }
  getslidernews()async{
    SliderNews slider=SliderNews();
    await slider.getTopNews();
    sliders=slider.sliders;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const  Icon(Icons.arrow_back,color: Colors.blue,)),
        title: Text(
          "${widget.news!+" عاجلة"}",
          style: TextStyle(
              color: Colors.blue,
              fontSize: h*0.05,
              fontFamily: "first",
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics:const ClampingScrollPhysics(),
        itemCount: widget.news=="اخبار"?sliders.length:articles.length,
        itemBuilder: (BuildContext context, int index) {
          return showCategoryNews(
              urlimage: "https://images.mktw.net/im-863440/social",
              url:"${widget.news=="اخبار"?sliders[index].url:articles[index].url}" ,
              title: "${widget.news=="اخبار"?sliders[index].title:articles[index].title}");
        }
        ,

      ),
    );
  }
}
