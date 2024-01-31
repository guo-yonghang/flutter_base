import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HeroPage extends StatefulWidget {
  final Map arguments;
  const HeroPage({super.key, required this.arguments});
  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  late int current = 0;
  late List list = [];
  late int currentPage = 1;
  @override
  void initState() {
    super.initState();
    current = widget.arguments['current'];
    list = widget.arguments['list'];
    currentPage = widget.arguments['current'] + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: list[current],
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: PhotoViewGallery.builder(
                    itemCount: list.length,
                    pageController: PageController(initialPage: current),
                    //长按弹出菜单
                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index + 1;
                      });
                    },
                    builder: ((context, index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(list[index]),
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                        minScale: PhotoViewComputedScale.contained * 0.5,
                      );
                    })),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: Text(
                  '$currentPage/${list.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
