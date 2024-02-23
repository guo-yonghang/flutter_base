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
            title: Text("list_view".tr),
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
          ListTile(
            leading: const Icon(Icons.date_range),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("日期时间国际化"),
            onTap: () {
              Get.toNamed('/datetime');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.data_array),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("数据格式转换"),
            onTap: () {
              Get.toNamed('/jsonmap');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.request_page),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("dio请求数据"),
            onTap: () {
              Get.toNamed('/request');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.more_horiz),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("下拉下拉加载"),
            onTap: () {
              Get.toNamed('/loadmore');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.web),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("WebView页面"),
            onTap: () {
              Get.toNamed('/webcontent');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.plumbing),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("设备信息网络状态其他应用"),
            onTap: () {
              Get.toNamed('/devicelaunch');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.video_file),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("视频播放"),
            onTap: () {
              Get.toNamed('/videoplayer');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.image),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("图片视频选择"),
            onTap: () {
              Get.toNamed('/imagepicker');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.storage),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("本地存储"),
            onTap: () {
              Get.toNamed('/sharedpreferences');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.barcode_reader),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("扫码识别"),
            onTap: () {
              Get.toNamed('/barcodescan');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.barcode_reader),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const Text("Get Utils"),
            onTap: () {
              Get.toNamed('/getutils');
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
