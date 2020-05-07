import 'dart:io';

import 'package:contacts_app/shared/styles.dart';
import 'package:flutter/widgets.dart';

class ContactDetailsImage extends StatelessWidget {
  final String image;

  ContactDetailsImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: basePrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(200),
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image == null
                ? AssetImage("assets/images/profile-picture.png")
                : FileImage(
                    File(image),
                  ),
          ),
        ),
      ),
    );
  }
}
