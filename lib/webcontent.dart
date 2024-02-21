import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebContentPage extends StatefulWidget {
  const WebContentPage({super.key});

  @override
  State<WebContentPage> createState() => _WebContentPageState();
}

class _WebContentPageState extends State<WebContentPage> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Content Page'),
      ),
      body: Column(children: [
        if (loading)
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
          ),
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse('https://www.baidu.com'),
            ),
            onProgressChanged: (controllerm, progress) {
              if (progress == 100) {
                setState(() {
                  loading = false;
                });
              }
            },
          ),
        ),
      ]),
    );
  }
}
