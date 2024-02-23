import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.mode_edit_outline),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text("系统主题"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 160,
                    color: Get.isDarkMode ? Colors.black87 : Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wb_sunny_outlined),
                          trailing: Get.isDarkMode
                              ? const Text('')
                              : const Icon(
                                  Icons.check_outlined,
                                  color: Colors.blue,
                                ),
                          title: const Text("亮色模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                            Get.back();
                          },
                        ),
                        const Divider(),
                        ListTile(
                          //左侧黑夜图标
                          leading: const Icon(Icons.nightlight_round),
                          trailing: Get.isDarkMode
                              ? const Icon(
                                  Icons.check_outlined,
                                  color: Colors.blue,
                                )
                              : const Text(''),
                          title: const Text("黑夜模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            //点击切换中文英文
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.language),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: const Text("语言设置"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 160,
                    color: Get.isDarkMode ? Colors.black87 : Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.language),
                          trailing: Get.locale?.languageCode == 'zh'
                              ? const Icon(
                                  Icons.check_outlined,
                                  color: Colors.blue,
                                )
                              : const Text(''),
                          title: const Text("中文"),
                          onTap: () {
                            Get.updateLocale(const Locale('zh', 'CN'));
                            Get.back();
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.language),
                          trailing: Get.locale?.languageCode == 'en'
                              ? const Icon(
                                  Icons.check_outlined,
                                  color: Colors.blue,
                                )
                              : const Text(''),
                          title: const Text("English"),
                          onTap: () {
                            Get.updateLocale(const Locale('en', 'US'));
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
