import 'dart:io';

import 'package:flutter/material.dart';
import 'package:contacts_app/android/android.app.dart';

void main() {
  if (Platform.isIOS) {
  } else {
    runApp(AndroidApp());
  }
}
