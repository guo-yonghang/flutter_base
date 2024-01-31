import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewPage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _count = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _count,
        onPageChanged: (index) {
          if (_count == index + 2) {
            setState(() {
              _count += 5;
            });
          }
        },
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              '第${index + 1}个视频',
              style: const TextStyle(fontSize: 60, color: Colors.red),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
