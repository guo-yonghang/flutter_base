import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  List _list = [];

  _getData() async {
    var res = await Dio().get('https://jdmall.itying.com/api/pcate');
    print(res.data['result']);
    setState(() {
      _list = res.data['result'];
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: _list.isNotEmpty
          ? ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${_list[index]['title']}'),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
