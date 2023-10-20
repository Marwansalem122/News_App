import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/slider_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/pages/blogtitle.dart';
import 'package:news_app/pages/category.dart';
import 'package:news_app/services/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'article_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories=[];
  List<SliderModel> sliders=[];
  List<ArticleModel>articles=[];
  int activeindex=0;
  bool loading=true;
  @override
  void initState() {
    categories=getCategories();
    getslidernews();
   getnews();

    super.initState();
  }
  getnews()async{
    News classnew=News();
    await classnew.getNews();
    articles=classnew.news;
    setState(() {
      loading=false;
    });
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
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "اخبار مصر",
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
        body: loading?Center(child: CircularProgressIndicator(),):Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Container(
                    margin: EdgeInsets.only(bottom: h*0.03),
                    height: h*0.2,
                  width: w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context,i){
                        return CategoryTile(
                          categoryname: categories[i].categoryName,
                          image:categories[i].image ,);
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: w*0.03),
                      child: Text(
                        "أخبار عاجلة!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: h*0.03,
                            fontFamily: "first"
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.03),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllNews(news: "اخبار")));
                        },
                        child: Text(
                          "جميع الاخبار",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: h*0.03,
                              fontFamily: "first"
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Container(
                  height: h*0.2,
                  child: CarouselSlider.builder(
                      itemCount: sliders.length,
                      itemBuilder: (context,index ,realIndex){
                      //  String? res=sliders[index].image;
                        String? res1=sliders[index].title;
                        return BuildImage( index, res1!);
                      },
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                       enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (index, reason) {
                          setState(() {
                            activeindex = index;
                          });
                  },
                  )
                  ),
                ),
                SizedBox(height: h*0.04,),
                BuildIndicator(),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: w*0.03),
                      child: Text(
                        "أخبار تريند!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: h*0.03,
                          fontFamily: "first"
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.03),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllNews(news: "اخبار")));
                        },
                        child: Text(
                          "جميع الاخبار",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: h*0.03,
                              fontFamily: "first"
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  //width: w*0.9,
                //   height: h*0.25,
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BlogTitle(urlimage: "https://images.mktw.net/im-863440/social",url:"${articles[index].url}" ,
                          title: "${articles[index].title}", description: "${articles[index].author}",

                        fun:(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticleViewPage(url: "${articles[index].url}")));
                        } ,);
                    }
                    ,

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget BuildImage(int index,String name){
    final w =MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Stack(
      children: [
       Container(
            margin: EdgeInsets.only(right: w*0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CachedNetworkImage(
                imageUrl: "https://images.mktw.net/im-863440/social",
                height: h*0.2,
                width: w,
                fit: BoxFit.fill,
              ),
            ),
          ),

        Container(
          width: w*0.8,
          margin: EdgeInsets.only(top: h*0.12,right: w*0.05),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30)
                ,bottomLeft: Radius.circular(30)
            )
          ),
          child: Center(child: Text(
            name,
            style: TextStyle(
              fontSize: h*0.04,
                color: Colors.white,
                fontFamily: "first"
            ),
          )
          ),
        )
      ],
    );
  }
  Widget BuildIndicator(){
    final w =MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: sliders.length,
        effect:SwapEffect (
          dotWidth: w*0.03,
          dotHeight: h*0.02,
          activeDotColor: Colors.blue
        ) ,
    );
  }
}
