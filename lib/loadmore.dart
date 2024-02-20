import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoadmorePage extends StatefulWidget {
  const LoadmorePage({super.key});

  @override
  State<LoadmorePage> createState() => _LoadmorePageState();
}

class _LoadmorePageState extends State<LoadmorePage> {
  final ScrollController _scrollController = ScrollController();

  bool loading = false;
  bool completed = false;
  int _page = 1;
  List list = [];

  _getData() async {
    if (loading || completed) {
      return;
    }
    loading = true;
    String apiUrl =
        'https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}';
    print(apiUrl);
    var res = await Dio().get(apiUrl);
    var newData = json.decode(res.data);
    setState(() {
      list.addAll(newData['result']);
      _page = _page + 1;
      completed = newData['result'].length < 20;
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        _getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Loadmore Page'),
        ),
        body: list.isNotEmpty
            ? RefreshIndicator(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    if (index == list.length - 1) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text('${list[index]['title']}'),
                            onTap: () {
                              Get.toNamed("/newscontent",
                                  arguments: {"aid": list[index]['aid']});
                            },
                          ),
                          Center(
                            child: completed
                                ? const Text('我是有底线的')
                                : const CircularProgressIndicator(),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          ListTile(
                            title: Text('${list[index]['title']}'),
                            onTap: () {
                              Get.toNamed("/newscontent",
                                  arguments: {"aid": list[index]['aid']});
                            },
                          ),
                          const Divider()
                        ],
                      );
                    }
                  },
                ),
                onRefresh: () async {
                  setState(() {
                    _page = 1;
                  });
                  await _getData();
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
