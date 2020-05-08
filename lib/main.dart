import 'dart:io';

import 'package:contacts_app/ios/ios.app.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/android/android.app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    runApp(IOSApp());
  } else {
    runApp(AndroidApp());
  }
}
