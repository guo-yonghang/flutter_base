import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String result = 'please scan barcode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scan Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //点击按钮实现扫码
        children: [
          ElevatedButton(
            onPressed: () async {
              //扫码
              var res = await BarcodeScanner.scan();
              setState(() {
                result = res.rawContent;
              });
              print(res);
            },
            child: const Text('Scan Barcode'),
          ),
          const SizedBox(height: 20),
          Text(result)
        ],
      ),
    );
  }
}
