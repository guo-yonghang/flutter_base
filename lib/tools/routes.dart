import 'package:get/get.dart';
import '../root.dart';
import '../list.dart';
import '../setting.dart';
import '../dialog.dart';
import '../pageview.dart';
import '../animatedlist.dart';

List<GetPage<dynamic>> GetPageRoutes = [
  GetPage(name: '/', page: () => const RootPage()),
  GetPage(name: '/list', page: () => const ListPage()),
  GetPage(name: '/setting', page: () => const SettingPage()),
  GetPage(name: '/dialog', page: () => const DialogPage()),
  GetPage(name: '/pageview', page: () => const PageViewPage()),
  GetPage(name: '/animatedlist', page: () => const AnimatedListPage()),
];
