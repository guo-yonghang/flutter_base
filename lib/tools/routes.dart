import 'package:get/get.dart';
import '../root.dart';
import '../list.dart';
import '../setting.dart';
import '../dialog.dart';
import '../pageview.dart';
import '../animatedlist.dart';
import '../datetime.dart';
import '../jsonmap.dart';
import '../request.dart';
import '../loadmore.dart';
import '../newscontent.dart';
import '../webcontent.dart';
import '../devicelaunch.dart';
import '../videoplayer.dart';
import '../imagepicker.dart';
import '../sharedpreferences.dart';
import '../barcodescan.dart';
import '../getutils.dart';

List<GetPage<dynamic>> GetPageRoutes = [
  GetPage(name: '/', page: () => const RootPage()),
  GetPage(name: '/list', page: () => const ListPage()),
  GetPage(name: '/setting', page: () => const SettingPage()),
  GetPage(name: '/dialog', page: () => const DialogPage()),
  GetPage(name: '/pageview', page: () => const PageViewPage()),
  GetPage(name: '/animatedlist', page: () => const AnimatedListPage()),
  GetPage(name: '/datetime', page: () => const DateTimePage()),
  GetPage(name: '/jsonmap', page: () => const JsonmapPage()),
  GetPage(name: '/request', page: () => const RequestPage()),
  GetPage(name: '/loadmore', page: () => const LoadmorePage()),
  GetPage(name: '/newscontent', page: () => const NewsContentPage()),
  GetPage(name: '/webcontent', page: () => const WebContentPage()),
  GetPage(name: '/devicelaunch', page: () => const DeviceLaunchPage()),
  GetPage(name: '/videoplayer', page: () => const VideoPlayerPage()),
  GetPage(name: '/imagepicker', page: () => const ImagePickerPage()),
  GetPage(
      name: '/sharedpreferences', page: () => const SharedPreferencesPage()),
  GetPage(name: '/barcodescan', page: () => const BarcodeScanPage()),
  GetPage(name: '/getutils', page: () => const GetUtilsPage()),
];
