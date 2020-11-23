# kzcity_picker

城市选择器 支持 ios、android、macos、web

如果外界不传值，使用默认地址列表
外界传值，可以使用外部city.json

注意city.json的格式必须同assets/city.json格式保持一致，否则无法正常显示

使用
```
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
```

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
