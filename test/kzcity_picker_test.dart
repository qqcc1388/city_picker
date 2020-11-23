import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kzcity_picker/kzcity_picker.dart';

void main() {
  const MethodChannel channel = MethodChannel('kzcity_picker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await KzcityPicker.platformVersion, '42');
  });
}
