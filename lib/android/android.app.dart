import 'package:contacts_app/android/styles.dart';
import 'package:contacts_app/android/views/home.view.dart';
import 'package:contacts_app/android/views/splash.view.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: androidTheme(),
      home: HomeView(),
    );
  }
}
