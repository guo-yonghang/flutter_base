import 'package:flutter/material.dart';
import 'dart:convert';

class JsonmapPage extends StatefulWidget {
  const JsonmapPage({super.key});

  @override
  State<JsonmapPage> createState() => _JsonmapState();
}

class _JsonmapState extends State<JsonmapPage> {
  @override
  void initState() {
    super.initState();
    Map userInfo = {"name": "郭永航", "age": 20};
    //转化为json
    String str = json.encode(userInfo);
    print('str:$str');
    //再转为map类型
    Map userInfo2 = json.decode(str);
    print('userInfo2:$userInfo2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Json Map'),
        ),
        //可以下拉刷新的对话列表，包含头像、昵称、最后一条消息、时间等信息
        body: const Center(
          child: Text('111'),
        ));
  }
}
