import 'package:flutter/material.dart';

import 'category_news.dart';
class CategoryTile extends StatelessWidget {
  final categoryname;
  final image;
  const CategoryTile({super.key, this.categoryname, this.image});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryNews(name: "${categoryname}")));
      } ,
      child: Container(
        margin: EdgeInsets.only(right: w*0.05,top: h*0.05),

        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: w*0.5,
                height: h*0.25,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: w*0.5,
              height: h*0.25,
              child: Center(
                child: Text(
                  "${categoryname}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    fontSize: w*0.05
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
