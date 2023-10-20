import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/article_view.dart';
class showCategoryNews extends StatelessWidget {
  String? title;
  String? urlimage;
  String? url;
   showCategoryNews({
     super.key,
     required this.title,
     required this.urlimage, required this.url
   });

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticleViewPage(url: "$url")));
      } ,
      child: Card(

        elevation: 9,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: w*0.05),
          child:Column(
            children: [
              SizedBox(height: h*0.02,),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl:"$urlimage",
                  // height: h*0.2,
                  // width: w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: h*0.02,),
              Text(
               " $title",
                style: TextStyle(
                    fontSize: h*0.04,
                    color: Colors.black,
                    fontFamily: "first"
                ),
              ),
              SizedBox(height: h*0.04,),
            ],
          ),
        ),
      ),
    );
  }
}
