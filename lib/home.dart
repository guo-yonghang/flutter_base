import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.list_alt),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("列表展示"),
            onTap: () {
              Get.toNamed('/list');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.qr_code),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("弹框展示"),
            onTap: () {
              Get.toNamed('/dialog');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.tiktok),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("抖音展示"),
            onTap: () {
              Get.toNamed('/pageview');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.animation),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("动画列表展示"),
            onTap: () {
              Get.toNamed('/animatedlist');
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

//创建DrawerWidget
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: const Text('逆境生长'),
                  accountEmail: const Text('19512111101@163.com'),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.itying.com/images/flutter/1.png'),
                  ),
                  otherAccountsPictures: [
                    Image.network(
                        'https://www.itying.com/images/flutter/3.png'),
                    Image.network(
                        'https://www.itying.com/images/flutter/4.png'),
                    Image.network(
                        'https://www.itying.com/images/flutter/5.png'),
                  ],
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.itying.com/images/flutter/2.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.people),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("个人中心"),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.settings),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("系统设置"),
            onTap: () {
              Get.back();
              Get.toNamed('/setting');
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
