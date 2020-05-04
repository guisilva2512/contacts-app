import 'package:contacts_app/ios/styles.dart';
import 'package:flutter/cupertino.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
            ),
            Icon(
              CupertinoIcons.padlock,
              size: 72,
              color: accentColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Meus Contatos",
              style: TextStyle(
                fontSize: 24,
                color: accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
