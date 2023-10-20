import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
class ImageFromLink extends StatelessWidget {
  final String imageUrl;

  ImageFromLink({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String? src;

    void extractImageUrl(String htmlContent) {
      dom.Document document = parser.parse(htmlContent);
      dom.Element? imageElement = document.querySelector('img');
      src = imageElement?.attributes[imageUrl];
    }
    extractImageUrl(imageUrl);

    return FutureBuilder<File>(
      future: src != null ? DefaultCacheManager().getSingleFile(src!) : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
          return Image.file(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('Error loading image');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
