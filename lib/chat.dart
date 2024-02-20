import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      //可以下拉刷新的对话列表，包含头像、昵称、最后一条消息、时间等信息
      body: RefreshIndicator(
        onRefresh: () async {
          //模拟网络请求
          await Future.delayed(const Duration(seconds: 2));
        },
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const CircleAvatar(
                child: FlutterLogo(),
              ),
              title: const Text('昵称'),
              subtitle: const Text('最后一条消息'),
              trailing: const Text('时间'),
              onTap: () {
                //跳转到聊天详情页
              },
            );
          },
        ),
      ),
    );
  }
}
