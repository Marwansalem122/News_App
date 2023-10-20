import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart'as http;
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  // void initState() {
  //   super.initState();
  //
  //   // #docregion webview_controller
  //
  //   // #enddocregion webview_controller
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        //initialUrl: " https://news.google.com/rss/articles/CBMiMGh0dHBzOi8vd3d3LmJiYy5jb20vYXJhYmljL2FydGljbGVzL2NqcTR4OHE5Mng5b9IBNGh0dHBzOi8vd3d3LmJiYy5jb20vYXJhYmljL2FydGljbGVzL2NqcTR4OHE5Mng5by5hbXA?oc=5",
        controller: controller,

      ),
    );
  }
}
