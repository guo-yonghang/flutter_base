import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';

class NewsContentPage extends StatefulWidget {
  const NewsContentPage({
    super.key,
  });

  @override
  State<NewsContentPage> createState() => _NewsContentPageState();
}

class _NewsContentPageState extends State<NewsContentPage> {
  List list = [];
  getData() async {
    String apiUrl =
        'https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${Get.arguments['aid']}';
    var res = await Dio().get(apiUrl);
    var val = json.decode(res.data)['result'];
    setState(() {
      list = val;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Content'),
      ),
      body: list.isNotEmpty
          ? ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${list[0]['title']}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Html(
                  data: list[0]['content'],
                  style: {
                    "body": Style(backgroundColor: Colors.white),
                    'p': Style(fontSize: FontSize.large)
                  },
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
