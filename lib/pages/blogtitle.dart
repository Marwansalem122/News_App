import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class BlogTitle extends StatelessWidget {
  String urlimage,title,description,url;
  var fun;
   BlogTitle({
    super.key,
    required this.urlimage,
    required this.title,
    required this.description,
    required this.url,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: fun,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),

       // color: Colors.blue,

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(

                width:w*0.4 ,
                height: h*0.3, imageUrl: urlimage,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                      title,
                      style: TextStyle(
                        fontSize: h*0.03,
                          fontFamily: "first"
                      ),
                      maxLines: 2,
                    ),

                  SizedBox(height: h*0.02),
                  Container(
                    margin: EdgeInsets.only(right: w*0.02),
                    width: w*0.8,
                    child: Text(
                        description,
                      style: TextStyle(
                        fontSize: h*0.02,
                        fontFamily: "first",
                        color: Colors.black54
                      ),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
