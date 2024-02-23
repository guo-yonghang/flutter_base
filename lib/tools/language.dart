import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hellow': "你好世界",
          "list_view": '列表展示',
        },
        "en_US": {
          'hellow': 'Hellow World',
          "list_view": 'List View',
        }
      };
}
