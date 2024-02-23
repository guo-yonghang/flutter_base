import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminState();
}

class _AdminState extends State<AdminPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: const Center(
        child: Text('Welcome to the Admin Page!'),
      ),
    );
  }
}

// final name = RxString('');
// final address = ''.obs;
// RxString sex = Rx<String>("");
// final RxInt count = 0.obs;
// final RxList<String> list = <String>[].obs;
// Obx(()=>Text('name: ${nam.value}, address: ${address.value}'));

/* 
  class Person {
    RxString name = 'guoyonghang'.obs;
    RxInt age = 22.obs;
  }
  var p = new Person();
  Obx(()=>Text("${p.name}"));
  p.name.value = p.name.value += '6';
 */

/* 
  class Animal{
    RxString name;
    RxInt age;
    Animal(this.name,this.age);
  }
  var cat = new Animal('cat',2).obs;
  Obx(()=>Text("${cat.value.name}"));
  a.value.name = 'dog';
  a.value = a.value;
 */

/* 
  class CounterController extends GetxController {
    var count = 0.obs;
    increment() => count++;
  }
  Controller c = Get.put(CounterController());
  Obx(()=>Text("${c.count}"));
  c.increment();
  c.count++;
 */

/* 
  class AllControllerBinding implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<CounterController>(() => CounterController());
    }
  }
  
  use:
  return GetMaterialApp(
    initialBinding: AllControllerBinding(),
    home: Home(),
  );
  or:
  GetPage(binding:AllControllerBinding());

  CounterController counter = Get.find();
 */

/* 
  class ShopPage extrands GetView<ShopController> {
    @override
    Widget build(BuildContext context) {
      Gety.put(ShopController());
      return Scaffold(
        appBar: AppBar(
          title: Text('Shop Page'),
        ),
        body: Center(
          child: Obx(() => Text('Count: ${controller.count}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.increment();
          },
          child: Icon(Icons.add),
        ),
      );
    }
  }
  也可以先生成ControllBinding然后在路由的binding中使用
 */

