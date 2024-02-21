import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class DeviceLaunchPage extends StatefulWidget {
  const DeviceLaunchPage({super.key});

  @override
  State<DeviceLaunchPage> createState() => _DeviceLaunchPageState();
}

class _DeviceLaunchPageState extends State<DeviceLaunchPage> {
  late StreamSubscription<ConnectivityResult> subscription;
  final devideviceInfoPlugin = DeviceInfoPlugin();
  final Uri uri = Uri.parse('https://baidu.com');

  getDeviceInfo() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        print('wifi');
      } else if (result == ConnectivityResult.mobile) {
        print('手机网络');
      } else if (result == ConnectivityResult.ethernet) {
        print('ethernet');
      } else {
        print('无网络');
      }
    });
    devideviceInfoPlugin.deviceInfo.then((deviceInfo) {
      print("deviceInfo$deviceInfo");
    });
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Launch Page'),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              //点击按钮跳转到浏览器打开网页
              ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(uri)) {
                    throw Exception('无法打开 $uri');
                  }
                },
                child: const Text('Open Browser'),
              ),
              //点击按钮打开支付宝
              ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(Uri.parse('alipays://'))) {
                    throw Exception('无法打开支付宝');
                  }
                },
                child: const Text('Open Alipay'),
              ),
              //打开苹果地图
              ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(Uri.parse('http://maps.apple.com/'))) {
                    throw Exception('无法打开苹果地图');
                  }
                },
                child: const Text('Open Apple Map'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
