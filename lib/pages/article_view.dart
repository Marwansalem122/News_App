import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewPage extends StatefulWidget {
   final  url;

   ArticleViewPage({

   required this.url
  });

  @override
  State<ArticleViewPage> createState() => _ArticleViewPageState();
}

class _ArticleViewPageState extends State<ArticleViewPage> {
  @override



    @override
    Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
      WebViewController controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
      return Scaffold(
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
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back,color: Colors.blue,)),
          backgroundColor: Colors.white,
        ),
        body: WebViewWidget(
          controller: controller,

        ),
      );
  }
}
