import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kzcity_picker/kzcity_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String citySelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(citySelect ?? '地址'),
          FloatingActionButton(
            onPressed: _example1,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      )),
    );
  }


/// 使用默认地址
  void _example1() async {
    final res = await KzcityPicker.showPicker(context);
    print(res.province + res.city + res.area);
    setState(() {
      citySelect = res.province + res.city + res.area;
    });

  }

/// 外部自定义city.json
  void _example2() async {
    var cityStr = await rootBundle.loadString('assets/city.json');
    List datas = json.decode(cityStr) as List;
    final res = await KzcityPicker.showPicker(context,datas: datas);
    print(res.province + res.city + res.area);
    setState(() {
      citySelect = res.province + res.city + res.area;
    });

  }
}
