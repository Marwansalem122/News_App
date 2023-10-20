import 'package:flutter/material.dart';
import 'package:news_app/pages/show_category_news.dart';

import '../model/show_category.dart';
import '../services/show_category_new.dart';
class CategoryNews extends StatefulWidget {
  String? name;
   CategoryNews({
     super.key,
   required this.name
   });

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategory>categories=[];
  bool loading=true;

  @override
  void initState() {
   getcategorynew();
    super.initState();
  }
  getcategorynew()async{
    ShowCategoryNew category=ShowCategoryNew();
    await category.getCategoryNews("${widget.name?.toLowerCase()}");
    categories=category.categories;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
  
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
         " ${widget.name}",
          style: TextStyle(
              color: Colors.blue,
              fontSize: h*0.05,
              fontFamily: "first",
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon(Icons.arrow_back,color: Colors.blue,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics:const ClampingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return showCategoryNews(
              urlimage: "https://images.mktw.net/im-863440/social",
              url:"${categories[index].url}" ,
              title: "${categories[index].title}");
        }
        ,

      ),
    );
  }
}
