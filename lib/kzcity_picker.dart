library kzcity_picker;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kzcity_picker/city_result.dart';
import 'city_picker.dart';

export 'city_picker.dart';
export 'city_result.dart';

class KzcityPicker {
  static const MethodChannel _channel = const MethodChannel('kzcity_picker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<CityResult> showPicker(BuildContext context, {List datas}) {
    Completer<CityResult> completer = Completer();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return CityPickerView(
          key: Key('pickerkey'),
          params: datas,
          onResult: (res) {
            completer.complete(res);
          },
        );
      },
    );
    return completer.future;
  }
}
