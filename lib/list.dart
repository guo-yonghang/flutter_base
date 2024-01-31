import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './tools/hero.dart';
import '/assets/listData.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListState();
}

class _ListState extends State<ListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'ListView'),
              Tab(text: 'GridView'),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [];
          },
          body: TabBarView(
            controller: _tabController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return HeroPage(
                          arguments: {
                            'current': index,
                            'list': listData.map((e) => e["imageUrl"]).toList(),
                          },
                        );
                      });
                    },
                    child: ListTile(
                      leading: Hero(
                        tag: listData[index]['imageUrl'],
                        child: Image.network(listData[index]['imageUrl']),
                      ),
                      title: Text(listData[index]['title']),
                      subtitle: Text(listData[index]['author']),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  );
                },
              ),
              GridView.builder(
                //上边距如何设置
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: index % 2 == 0
                        ? const EdgeInsets.only(left: 10)
                        : const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() {
                          return HeroPage(
                            arguments: {
                              'current': index,
                              'list':
                                  listData.map((e) => e["imageUrl"]).toList()
                            },
                          );
                        });
                      },
                      child: Column(
                        children: [
                          Hero(
                            tag: listData[index]['imageUrl'],
                            child: Image.network(listData[index]['imageUrl']),
                          ),
                          const SizedBox(height: 10),
                          Flexible(child: Text(listData[index]['title'])),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
