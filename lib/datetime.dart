import 'dart:math';

import 'package:flutter/material.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimeState();
}

class _DateTimeState extends State<DateTimePage> {
  @override
  void initState() {
    super.initState();

    DateTime d = DateTime.now();
    print(d);

    var str = '${d.year}-${d.month}-${d.day}-${d.hour}-${d.minute}-${d.second}';
    print(str);

    int time = d.millisecondsSinceEpoch;
    print(time);

    DateTime d2 = DateTime.fromMillisecondsSinceEpoch(time);
    print(d2);

    String str2 = '2021-10-01 12:00:00';
    DateTime d3 = DateTime.parse(str2);
    print(d3);
    print(d3.millisecondsSinceEpoch);

    DateTime d4 = DateTime(2023, 10, 1, 12, 0, 0, 0, 0);
    print(d4);

    //日期加减
    DateTime d5 = DateTime.now();
    print(d5);
    print(d5.add(const Duration(days: 5)));
    print(d5.add(const Duration(days: -5)));
    print(d5.add(const Duration(minutes: 5)));

    TimeOfDay t = TimeOfDay.now();
    print(t);
  }

  late DateTime dateTime = DateTime.now();
  late TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Time'),
      ),
      //可以下拉刷新的对话列表，包含头像、昵称、最后一条消息、时间等信息
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${dateTime.year}-${dateTime.month}-${dateTime.day}'),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime(1990, 1, 1),
                  lastDate: DateTime(2035, 1, 1),
                );
                if (d != null) {
                  setState(() {
                    dateTime = d;
                  });
                }
              },
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${time.hour}:${time.minute}'),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: () async {
                TimeOfDay? t =
                    await showTimePicker(context: context, initialTime: time);
                if (t != null) {
                  setState(() {
                    time = t;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
