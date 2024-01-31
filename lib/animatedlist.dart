import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimatedListPage> {
  final globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ['默认第一条', '默认第二条'];
  bool flag = false;
  Widget _buildItem(index) {
    return ListTile(
        title: Text(list[index]),
        trailing: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('提示'),
                    content: const Text('是否删除该条数据？'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('取消')),
                      TextButton(
                          onPressed: () {
                            _deleteItem(index);
                            Navigator.of(context).pop();
                          },
                          child: const Text('确定')),
                    ],
                  );
                });
          },
          icon: const Icon(Icons.delete_outline),
        ));
  }

  _deleteItem(index) {
    if (flag) return;
    flag = true;
    globalKey.currentState?.removeItem(index, (context, animation) {
      var removeItem = _buildItem(index);
      list.removeAt(index);
      return ScaleTransition(scale: animation, child: removeItem);
    });
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      flag = false;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add('新增一条数据');
            globalKey.currentState?.insertItem(list.length - 1);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: _buildItem(index),
          );
        },
      ),
    );
  }
}
