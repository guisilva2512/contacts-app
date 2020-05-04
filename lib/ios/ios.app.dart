import 'package:contacts_app/ios/styles.dart';
import 'package:contacts_app/ios/views/splash.view.dart';
import 'package:flutter/cupertino.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: iosTheme(),
      home: SplashView(),
    );
  }
}
