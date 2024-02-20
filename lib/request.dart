import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  _getData() async {
    var res = await Dio().get(
      'https://jdmall.itying.com/api/httpGet',
      queryParameters: {"username": "张三", "age": 20},
    );
    print(res.data);
  }

  _postData() async {
    var res = await Dio().post(
      'https://jdmall.itying.com/api/httpPost',
      data: {"username": "张三", "age": 20},
    );
    print(res.data);
  }

  _putData() async {
    var res = await Dio().put(
      'https://jdmall.itying.com/api/httpPut',
      data: {"id": "123", "username": "张三", "age": 20},
    );
    print(res.data);
  }

  _deleteData() async {
    var res = await Dio().delete(
      'https://jdmall.itying.com/api/httpDelete',
      queryParameters: {"id": "123", "username": "张三", "age": 20},
    );
    print(res.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _getData();
              },
              child: const Text('Get Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _postData();
              },
              child: const Text('Post Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _putData();
              },
              child: const Text('Put Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteData();
              },
              child: const Text('Delete Data'),
            ),
          ],
        ));
  }
}
