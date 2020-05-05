import 'dart:io';

import 'package:contacts_app/android/views/details.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final ContactModel model;

  ContactListItem({@required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network("https://picsum.photos/200/300"),
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          image: DecorationImage(
            // image: NetworkImage(model.image),
            image: model.image == null
                ? AssetImage("assets/images/profile-picture.png")
                : FileImage(
                    File(
                      model.image,
                    ),
                  ),
          ),
        ),
      ),
      title: Text(model.name ?? ""),
      subtitle: Text(model.phone ?? ""),
      trailing: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(),
            ),
          );
        },
        child: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
